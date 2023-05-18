class Sentence {
  String actualSentence;
  List<String> splittedSentence;
  bool showSentence;

  Sentence({
    required this.actualSentence,
    required this.showSentence,
    required this.splittedSentence,
  });

  Sentence copyWith({
    String? actualSentence,
    List<String>? splittedSentence,
    bool? showSentence,
  }) {
    return Sentence(
      actualSentence: actualSentence ?? this.actualSentence,
      showSentence: showSentence ?? this.showSentence,
      splittedSentence: splittedSentence ?? this.splittedSentence,
    );
  }
}
