import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordpuzzle/models/Sentence.dart';
import 'package:wordpuzzle/utils/extenstion/stringSplit.dart';

class SentenceStateNotifier extends StateNotifier<Sentence> {
  SentenceStateNotifier()
      : super(
          Sentence(
            actualSentence: "",
            showSentence: true,
            splittedSentence: [],
          ),
        );
  void setSentenceState(String sentence) {
    Sentence newState = state.copyWith(
      actualSentence: sentence,
      splittedSentence: sentence.splitIt(),
      showSentence: true,
    );
    state.actualSentence = newState.actualSentence;
    state.showSentence = newState.showSentence;
    state.splittedSentence = newState.splittedSentence;
  }
}
