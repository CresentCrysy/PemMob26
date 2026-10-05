import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'mahasiswa.dart';
import 'musik.dart';

void main() {
  runApp(const Raymon());
}

class Raymon extends StatefulWidget {
  const Raymon({super.key});

  @override
  State<Raymon> createState() => _RaymonState();
}

class _RaymonState extends State<Raymon> {
  // Audio Player State
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;

  // Controller & Data Komentar
  final TextEditingController _commentController = TextEditingController();
  final List<String> _comments = [];

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Listener untuk mendeteksi status audio (Selesai/Pause/Play)
    _audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _commentController.dispose();
    super.dispose();
  }

  // Fungsi untuk Memutar/Menghentikan Audio
  void _togglePlayPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(AssetSource('audio/TheManWhoCantBeMoved.mp3'));
    }
  }

  // Fungsi Menambah Komentar
  void _addComment() {
    final text = _commentController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _comments.add(text);
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mahasiswa = Mahasiswa(nama: "Raymon", umur: 20, kelas: "TI-3C");

    final musik = Musik(
      judul: "The man who can't be moved",
      penyanyi: "The Script",
      bait1: "Going back to the corner where I first saw you\nGonna camp in my sleeping bag, I'm not gonna move\nGot some words on cardboard, got your picture in my hand\nSaying, \"If you see this girl, can you tell her where I am?\"\nSome try to hand me money, they don't understand\nI'm not broke, I'm just a broken hearted man\nI know it makes no sense but what else can I do\nHow can I move on when I'm still in love with you",
      bait2: "'Cause if one day you wake up and find that you're missing me\nAnd your heart starts to wonder where on this Earth I could be\nThinkin' maybe you'll come back here to the place that we'd meet\nAnd you'll see me waiting for you on the corner of the street\nSo I'm not moving, I'm not moving",
      bait3: "Policeman says, \"Son, you can't stay here\"\nI said, \"There's someone I'm waiting for if it's a day, a month, a year\"\nGotta stand my ground even if it rains or snows\nIf she changes her mind, this is the first place she will go",
      bait4: "'Cause if one day you wake up and find that you're missing me\nAnd your heart starts to wonder where on this Earth I could be\nThinking\nmaybe you'll come back here to the place that we'd meet\nAnd you'll see me waiting for you on the corner of the street\nSo I'm not moving,\nI'm not moving\nI'm not moving, I'm not moving",
      bait5: "People talk about the guy that's waiting on a girl\nThere are no holes in his shoes but a big hole in his world\n",
      bait6: "Maybe I'll get famous as the man who can't be moved\nMaybe you won't mean to, but you'll see me on the news\nAnd you'll come running to the corner\n'Cause you'll know it's just for you\nI'm the man who can't be moved\nI'm the man who can't be moved\n",
      bait7: "'Cause if one day you wake up and find that you're missing me (find that you'撑ing me)\nAnd your heart starts to wonder where on this Earth I could be (where on this Earth I could be)\nThinkin' maybe you'll come back here to the place that we'd meet (to the place that we'd meet)\nAnd you'll see me waiting for you on the corner of the street\n",
      bait8: "'cause if one day you wake up and find that you're missing me\n(I'm not moving) and your heart starts to wonder where on this Earth I could be\n(I'm not moving) thinkin' maybe you'll come back here to the place that we'd meet\n(I'm not moving) and you'll see me waiting for you on the corner of the street\n",
      bait9: "Going back to the corner where I first saw you\nGonna camp in my sleeping bag, I'm not gonna move\n",
    );

    final listBait = [
      musik.bait1,
      musik.bait2,
      musik.bait3,
      musik.bait4,
      musik.bait5,
      musik.bait6,
      musik.bait7,
      musik.bait8,
      musik.bait9,
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF121212),
        appBar: AppBar(
          title: Text(
            musik.judul,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.black26,
          elevation: 0,
        ),
        body: Row(
          children: [
            // ==================== KOLOM KIRI: GAMBAR ====================
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'assets/images/TheScript.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[850],
                          child: const Center(
                            child: Text(
                              'Gambar\ntidak ditemukan',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white54),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),

            const VerticalDivider(width: 1, color: Colors.white12),

            // ==================== KOLOM TENGAH: LIRIK ====================
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      musik.penyanyi,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Divider(color: Colors.white24),
                    const SizedBox(height: 8),

                    // List Lirik dengan Scrolling
                    Expanded(
                      child: ListView.separated(
                        itemCount: listBait.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          return Text(
                            listBait[index],
                            style: const TextStyle(
                              fontSize: 15,
                              height: 1.5,
                              backgroundColor: Colors.black,
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Created By: ${mahasiswa.nama} (${mahasiswa.kelas})",
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white38,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const VerticalDivider(width: 1, color: Colors.white12),

            // ==================== KOLOM KANAN: KOMENTAR ====================
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Komentar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Daftar Komentar (Scrollable)
                    Expanded(
                      child: _comments.isEmpty
                          ? const Center(
                              child: Text(
                                "Belum ada komentar.\nJadilah yang pertama!",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white38),
                              ),
                            )
                          : ListView.builder(
                              itemCount: _comments.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: Colors.white10,
                                  margin: const EdgeInsets.only(bottom: 8.0),
                                  child: ListTile(
                                    dense: true,
                                    leading: const CircleAvatar(
                                      radius: 14,
                                      child: Icon(Icons.person, size: 16),
                                    ),
                                    title: Text(
                                      _comments[index],
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),

                    const SizedBox(height: 8),

                    // Input Komentar
                    TextField(
                      controller: _commentController,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _addComment(),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Tulis komentar...",
                        hintStyle: const TextStyle(color: Colors.white38),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white12,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.send_rounded, color: Colors.deepPurpleAccent),
                          onPressed: _addComment,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // ==================== PLAYER NAVBAR BAWAH ====================
        bottomNavigationBar: Container(
          color: Colors.black87,
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous, size: 28),
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                  size: 42,
                  color: Colors.deepPurpleAccent,
                ),
                onPressed: _togglePlayPause,
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.skip_next, size: 28),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}