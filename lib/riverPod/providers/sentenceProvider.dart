import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordpuzzle/models/Sentence.dart';
import 'package:wordpuzzle/riverPod/stateNotifiers/sentenceStateNotifier.dart';

final sentenceStateProvider =
    StateNotifierProvider<SentenceStateNotifier, Sentence>((ref) {
  return SentenceStateNotifier();
});
