import 'quizModel.dart';

class QuizData {
  int _quizNumber = 0;
  bool _quizOver = false;

  List<QuizModel> _quizList = [
    QuizModel('Some cats are actually allergic to humans', true),
    QuizModel('You can lead a cow down stairs but not up stairs.', false),
    QuizModel(
        'Approximately one quarter of human bones are in the feet.', true),
    QuizModel('A slug\'s blood is green.', true),
    QuizModel('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    QuizModel('It is illegal to pee in the Ocean in Portugal.', true),
    QuizModel(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    QuizModel(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    QuizModel(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    QuizModel(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    QuizModel('Google was originally called \"Backrub\".', true),
    QuizModel(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    QuizModel(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  String getQuizText() {
    return _quizList[_quizNumber].quizText;
  }

  bool getQuizAnswer() {
    return _quizList[_quizNumber].quizAnswer;
  }

  void nextQuestion() {
    if (_quizNumber < _quizList.length - 1) {
      _quizNumber++;
    } else {
      _quizOver = true;
    }
  }

  int getQuizLength() {
    return _quizList.length;
  }

  int getQuizNumber() {
    return _quizNumber;
  }

  bool get quizOver => _quizOver;

  void resetQuiz() {
    _quizNumber = 0;
    _quizOver = false;
  }
}
