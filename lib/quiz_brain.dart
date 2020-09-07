import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  bool _isNotLast = true;
  List<Question> _questionList = [
    Question(
        qns: 'You can lead a cow down stairs but not up stairs.', ans: false),
    Question(
        qns: 'Approximately one quarter of human bones are in the feet.',
        ans: true),
    Question(qns: 'A slug\'s blood is green.', ans: true),
    Question(qns: 'Some cats are actually allergic to humans', ans: true),
    Question(
        qns: 'You can lead a cow down stairs but not up stairs.', ans: false),
    Question(
        qns: 'Approximately one quarter of human bones are in the feet.',
        ans: true),
    Question(qns: 'A slug\'s blood is green.', ans: true),
    Question(
        qns: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', ans: true),
    Question(qns: 'It is illegal to pee in the Ocean in Portugal.', ans: true),
    Question(
        qns:
            'No piece of square dry paper can be folded in half more than 7 times.',
        ans: false),
    Question(
        qns:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        ans: true),
    Question(
        qns:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        ans: false),
    Question(
        qns:
            'The total surface area of two human lungs is approximately 70 square metres.',
        ans: true),
    Question(qns: 'Google was originally called \"Backrub\".', ans: true),
    Question(
        qns:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        ans: true),
    Question(
        qns:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        ans: true),
  ];

  String getQuestion() {
    return _questionList[_questionNumber].qns;
  }

  bool getAnswer() {
    return _questionList[_questionNumber].ans;
  }

  void nextQuestion() {
    if (_questionNumber != _questionList.length - 1) {
      _questionNumber++;
    } else {
      _isNotLast = false;
    }
  }

  bool isNotLast() {
    return _isNotLast;
  }

  void reset() {
    _questionNumber = 0;
    _isNotLast = true;
  }
  // int getTotalLength() {
  //   return _questionList.length;
  // }
}
