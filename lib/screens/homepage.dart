import 'package:flutter/material.dart';
import 'package:wordpuzzle/components/wordAppBar.dart';
import 'package:wordpuzzle/components/wordChip.dart';
import 'package:wordpuzzle/utils/wordlist.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: wordAppBar(),
      body: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return SentenceChip(
            sentence: quotes[index],
          );
        },
      ),
    );
  }
}
