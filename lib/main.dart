import 'package:flutter/material.dart';
//import 'package:quizzler/question.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quiz_brain = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
//  List<String> question = [
//    'You can lead a cow down stairs but not up stairs.',
//    'Approximately one quarter of human bones are in the feet.',
//    'A slug\'s blood is green.',
//  ];
//   int questionNumber = 0;
  int quizLength = 0;
//  List<Question> questionList = [
//    Question(
//        qns: 'You can lead a cow down stairs but not up stairs.', ans: false),
//    Question(
//        qns: 'Approximately one quarter of human bones are in the feet.',
//        ans: true),
//    Question(qns: 'A slug\'s blood is green.', ans: true),
//  ];
  //totalNumberOfQuestions = questionList.length;
  //totalNumberOfQuestions = questionList.length;
//  List<Map<String, bool>> questions = [
//    {'You can lead a cow down stairs but not up stairs.': false},
//    {'Approximately one quarter of human bones are in the feet.': true},
//    {'A slug\'s blood is green.': true}
//  ];
//  Map<String, bool>[] List<Set<Object>> Questions = [
//    {"ergerg", true}
//  ];
  Icon _answerTick({bool isCorrect}) {
    if (isCorrect) {
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.close,
        color: Colors.red,
      );
    }
  }

  void _correctAnswer(bool userPicked) {
    bool _answer = quiz_brain.getAnswer();
//    if (isTrue) {
//      if (questionList[questionNumber].answer == true) {
//        return true;
//      } else {
//        return false;
//      }
//    } else {
//      if (questionList[questionNumber].answer == false) {
//        return true;
//      } else {
//        return false;
//      }
//    }

    if (quiz_brain.isNotLast()) {
      if (userPicked == _answer) {
        scoreKeeper.add(_answerTick(isCorrect: true));
      } else {
        scoreKeeper.add(_answerTick(isCorrect: false));
      }
      quiz_brain.nextQuestion();
      print(quiz_brain.getAnswer());
      print(quiz_brain.getQuestion());
    } else {
      Alert(
          context: context,
          title: "Quiz Ended",
          desc: "We Will reset the Quiz!!",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]).show();
      quiz_brain.reset();
      scoreKeeper = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    // quizLength = quiz_brain.getTotalLength();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz_brain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  _correctAnswer(true);
                  // if (quiz_brain.isNotLast()) {
                  //   scoreKeeper
                  //       .add(_answerTick(isCorrect: _correctAnswer(true)));
                  //   quiz_brain.nextQuestion();
                  // }

                  // if (questionNumber < quizLength - 1) {
                  //   scoreKeeper
                  //       .add(_answerTick(isCorrect: _correctAnswer(true)));
                  //   questionNumber++;
                  // } else if (questionNumber == quizLength - 1) {
                  //   scoreKeeper
                  //       .add(_answerTick(isCorrect: _correctAnswer(true)));
                  //   questionNumber = 0;
                  //   //scoreKeeper = [];
                  // }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  _correctAnswer(false);
                  // if (quiz_brain.isNotLast()) {
                  //   scoreKeeper
                  //       .add(_answerTick(isCorrect: _correctAnswer(false)));
                  //   quiz_brain.nextQuestion();
                  // }
                  // if (questionNumber < quizLength - 1) {
                  //   scoreKeeper
                  //       .add(_answerTick(isCorrect: _correctAnswer(false)));
                  //   questionNumber++;
                  // } else if (questionNumber == quizLength - 1) {
                  //   scoreKeeper
                  //       .add(_answerTick(isCorrect: _correctAnswer(false)));
                  //   questionNumber = 0;
                  //   //scoreKeeper = [];
                  // }
                });
              },
            ),
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
