class QuizModel {
  String _quizText;
  bool _quizAnswer;

  QuizModel(this._quizText, this._quizAnswer);

  String get quizText => _quizText;

  bool get quizAnswer => _quizAnswer;
}
