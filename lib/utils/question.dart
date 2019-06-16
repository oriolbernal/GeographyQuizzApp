class Question {
  final String question;
  final String correctAnswer;
  final List<String> wrongAnswers;
  List<String> _answers;

  Question(this.question, this.correctAnswer, this.wrongAnswers) {
    _answers = [];
    _answers.addAll(wrongAnswers);
    _answers.add(correctAnswer);
    _answers.shuffle();
  }

  String getPossibleAnswer(int index) {
    return _answers[index];
  }
}
