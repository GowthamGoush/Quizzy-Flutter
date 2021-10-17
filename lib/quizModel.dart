class QuizModel {  //  class (MODEL) containing the properties of quiz
  String _quizText;
  bool _quizAnswer;

  QuizModel(this._quizText, this._quizAnswer);

  String get quizText => _quizText;

  bool get quizAnswer => _quizAnswer;
}
