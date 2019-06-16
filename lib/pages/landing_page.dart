import 'package:flutter/material.dart';
import '../utils/quiz.dart';
import './quiz_page.dart';


class LandingPage extends StatelessWidget{

  final Quiz quiz;
  LandingPage(this.quiz);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.greenAccent,
      child: new InkWell( //fancy invisible button
        onTap: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage(quiz)), ModalRoute.withName(Navigator.defaultRouteName)),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Let's Quizzz", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold)),
            new Text("Tap to start", style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }

}