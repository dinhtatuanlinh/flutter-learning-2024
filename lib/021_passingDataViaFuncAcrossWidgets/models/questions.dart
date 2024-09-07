class QuestionModel {
  final String question;
  final List<String> answers;
  const QuestionModel(this.question, this.answers);

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}