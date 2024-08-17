import 'package:flutter/material.dart';
import 'package:nike/data/repo/comment_repo.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('data'),
          ElevatedButton(
              onPressed: () async {
                final coment = commentRepo.getComment(3).then((value) {
                  print(value[0].email);
                });
              },
              child: const Text('getData'))
        ],
      ),
    );
  }
}
