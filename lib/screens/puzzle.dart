import 'package:flutter/material.dart';
import 'package:wordpuzzle/components/wordAppBar.dart';
import 'package:wordpuzzle/components/wordWrapChips.dart';

class PuzzleScreen extends StatelessWidget {
  final String sentence;
  const PuzzleScreen({
    Key? key,
    required this.sentence,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: wordAppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WordWrapChips(sentence: sentence),
            WordWrapChips(sentence: sentence),
          ],
        ),
      ),
    );
  }
}
