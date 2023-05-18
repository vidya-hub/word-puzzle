import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordpuzzle/riverPod/providers/sentenceProvider.dart';
import 'package:wordpuzzle/screens/puzzle.dart';

class SentenceChip extends StatelessWidget {
  final String sentence;
  const SentenceChip({
    Key? key,
    required this.sentence,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return GestureDetector(
          onTap: () {
            ref.read(sentenceStateProvider.notifier).setSentenceState(sentence);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PuzzleScreen(
                    key: key,
                    sentence: sentence,
                  );
                },
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              color: Colors.yellow,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
              sentence,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ));
    });
  }
}
