import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordpuzzle/models/Sentence.dart';
import 'package:wordpuzzle/riverPod/providers/sentenceProvider.dart';

class WordWrapChips extends StatelessWidget {
  final String sentence;
  const WordWrapChips({
    Key? key,
    required this.sentence,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer(builder: (
          context,
          ref,
          child,
        ) {
          final Sentence sentenceState = ref.watch(sentenceStateProvider);
          return Wrap(
            children: List.generate(
              sentenceState.splittedSentence.length,
              (index) => Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 7,
                  ),
                  child: Text(
                    sentenceState.splittedSentence[index],
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
