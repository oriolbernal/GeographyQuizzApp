import 'package:flutter/material.dart';
import '../utils/quiz.dart';


class ScorePage extends StatelessWidget{

  final Quiz quiz;

  ScorePage(this.quiz);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your score: ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),),
          new Text(quiz.score.toString() +"/" + quiz.numQuestions.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),),
          new IconButton(
              icon: new Icon(Icons.arrow_right),
              color: Colors.white,
              iconSize: 50.0,
              onPressed: () {
                quiz.resetScores();
                Navigator.of(context).pop(quiz);
              }
          )
        ],
      ),
    );
  }

}