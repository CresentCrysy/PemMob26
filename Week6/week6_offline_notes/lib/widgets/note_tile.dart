import 'package:flutter/material.dart';
import '../data/local/note.dart'; // Sesuaikan path impor model Note Anda

class NoteTile extends StatelessWidget {
  const NoteTile({
    super.key,
    required this.note,
    required this.onTap,
    required this.onDelete,
  });

  final Note note;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        note.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (note.body.isNotEmpty) ...[
            Text(
              note.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
          ],
          // Tampilkan badge / Chip "belum tersinkron" bila note.dirty == true
          if (note.dirty)
            Chip(
              avatar: const Icon(
                Icons.sync_problem,
                size: 16,
                color: Colors.orange,
              ),
              label: const Text(
                'belum tersinkron',
                style: TextStyle(fontSize: 11, color: Colors.orange),
              ),
              backgroundColor: Colors.orange.shade50,
              padding: EdgeInsets.zero,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline, color: Colors.red),
        onPressed: onDelete,
      ),
    );
  }
}