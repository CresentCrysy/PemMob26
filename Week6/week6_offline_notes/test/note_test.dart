import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week6_offline_notes/data/local/note.dart';
import 'package:week6_offline_notes/data/repositories/note_repository.dart';
import 'package:week6_offline_notes/data/sync.dart';
import 'package:week6_offline_notes/providers/note_providers.dart';

class FakeNoteRepository extends NoteRepository {
  FakeNoteRepository({
    List<Note> items = const [],
    this.throwError = false,
  })  : items = [...items],
        super(
          openDb: () => throw UnimplementedError(),
        );

  final List<Note> items;
  final bool throwError;

  @override
  Future<List<Note>> fetchNotes() async {
    if (throwError) {
      throw Exception('db locked (simulasi)');
    }

    return items;
  }

  @override
  Future<int> countDirty() async {
    return items.where((note) => note.dirty).length;
  }

  @override
  Future<void> markAllSynced() async {
    for (var i = 0; i < items.length; i++) {
      items[i] = items[i].copyWith(
        dirty: false,
      );
    }
  }
}

Note _note(
  String title, {
  bool dirty = false,
  DateTime? at,
}) {
  return Note(
    title: title,
    updatedAt: at ?? DateTime(2026, 9, 18),
    dirty: dirty,
  );
}

void main() {
  // ============================================================
  // MODEL NOTE
  // ============================================================

  group('Model Note', () {
    test('fromMap aman terhadap field yang hilang', () {
      final note = Note.fromMap({
        'title': 'Belanja',
      });

      expect(note.title, 'Belanja');
      expect(note.body, '');
      expect(note.dirty, isFalse);
    });

    test('flag dirty bertahan pada serialisasi', () {
      final note = _note(
        'a',
        dirty: true,
      );

      final restored = Note.fromMap(
        note.toMap(),
      );

      expect(restored.dirty, isTrue);
      expect(restored.updatedAt, note.updatedAt);
    });
  });

  // ============================================================
  // PROVIDER DENGAN REPOSITORY PALSU
  // ============================================================

  group('Provider dengan repository palsu', () {
    test('notesProvider sukses', () async {
      final container = ProviderContainer(
        overrides: [
          noteRepositoryProvider.overrideWithValue(
            FakeNoteRepository(
              items: [
                _note('Tes'),
              ],
            ),
          ),
        ],
      );

      try {
        final notes = await container.read(
          notesProvider.future,
        );

        expect(notes.length, 1);
        expect(notes.first.title, 'Tes');
      } finally {
        container.dispose();
      }
    });

    test('notesProvider error', () async {
      final fakeRepo = FakeNoteRepository(
        throwError: true,
      );

      final container = ProviderContainer(
        overrides: [
          noteRepositoryProvider.overrideWithValue(
            fakeRepo,
          ),
        ],
      );

      try {
        final result = container.read(
          notesProvider,
        );

        expect(
          result,
          isA<AsyncLoading<List<Note>>>(),
        );

        // Beri kesempatan FutureProvider menjalankan
        // fetchNotes().
        await Future<void>.delayed(
          Duration.zero,
        );

        final state = container.read(
          notesProvider,
        );

        expect(
          state.hasError,
          isTrue,
        );

        expect(
          state.error,
          isA<Exception>(),
        );
      } finally {
        container.dispose();
      }
    });
  });

  // ============================================================
  // OFFLINE-FIRST
  // ============================================================

  group('Offline-first', () {
    test(
      'syncNotes membersihkan semua catatan dirty',
      () async {
        final repo = FakeNoteRepository(
          items: [
            _note(
              'a',
              dirty: true,
            ),
            _note(
              'b',
              dirty: true,
            ),
            _note('c'),
          ],
        );

        final synced = await syncNotes(
          repo,
          latency: Duration.zero,
        );

        expect(
          synced,
          2,
        );

        expect(
          await repo.countDirty(),
          0,
        );
      },
    );

    test(
      'syncNotes ditolak saat offline dan dirty tetap utuh',
      () async {
        final repo = FakeNoteRepository(
          items: [
            _note(
              'a',
              dirty: true,
            ),
          ],
        );

        await expectLater(
          syncNotes(
            repo,
            offline: true,
          ),
          throwsA(
            isA<OfflineException>(),
          ),
        );

        expect(
          await repo.countDirty(),
          1,
        );
      },
    );

    test(
      'resolveConflict memilih updatedAt terbaru',
      () {
        final local = _note(
          'lokal',
          at: DateTime(
            2026,
            9,
            18,
            10,
          ),
        );

        final remote = _note(
          'server',
          at: DateTime(
            2026,
            9,
            18,
            11,
          ),
        );

        expect(
          resolveConflict(
            local,
            remote,
          ).title,
          'server',
        );

        expect(
          resolveConflict(
            remote,
            local,
          ).title,
          'server',
        );
      },
    );
  });
}