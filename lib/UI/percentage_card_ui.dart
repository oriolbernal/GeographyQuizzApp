import 'package:flutter/material.dart';

class PercentageCardUI extends StatelessWidget {
  final double _percentComplete;
  final Color _color;

  PercentageCardUI(this._percentComplete, this._color);

  @override
  Widget build(BuildContext context) {
    return new Align(
        alignment: Alignment.bottomLeft,
        child: new Material(
          color: Colors.transparent,
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new LinearProgressIndicator(
                  value: _percentComplete,
                  backgroundColor: Colors.grey.withAlpha(50),
                  valueColor: new AlwaysStoppedAnimation<Color>(_color),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child:
                    new Text((_percentComplete * 100).round().toString() + "%"),
              )
            ],
          ),
        ));
  }
}
