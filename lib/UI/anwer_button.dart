import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final Color _color;
  final String _answer;
  final VoidCallback _onTap;

  AnswerButton(this._answer, this._color, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      // True button
      child: new Material(
        color: _color,
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.white, width: 5.0)),
              padding: new EdgeInsets.all(20.0),
              child: new Text(
                _answer,
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
