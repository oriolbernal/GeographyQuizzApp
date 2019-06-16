import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';// scroll
import '../utils/quiz.dart';
import './landing_page.dart';

class QuizzesProperties {
  static const int CAPITALS_QUIZ = 0;
  static const int FRONTIERS_QUIZ = 1;
  static const int POPULATION_QUIZ = 2;
  static const int FLAGS_QUIZ = 3;

  static const List<Color> colors = [
    const Color(0xFF07969E),
    const Color(0xFF45C48B),
    const Color(0xFFFBD130),
    const Color(0xFFFB6755),
    const Color(0xFFFFFFFF),
    const Color(0xFF000000),
  ];

  static List<Quiz> quizzes = [
    new Quiz(0, "Capitals", colors[0], "assets/world.png"),
    new Quiz(1, "Frontiers", colors[1], "assets/frontiers.png"),
    new Quiz(2, "Population", colors[2], "assets/population.png"),
    new Quiz(3, "Flags", colors[3], "assets/flag.png"),
  ];
}

class QuizSelector extends StatefulWidget {
  QuizSelector({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _QuizSelectorState createState() => new _QuizSelectorState();
}


class _QuizSelectorState extends State<QuizSelector> with TickerProviderStateMixin {

  Color backgroundColor;
  Color constBackColor;
  Tween<Color> colorTween; // An interpolation between two colors.
  ScrollController scrollController;

  Quiz quiz;

  @override
  void initState() {
    super.initState();
    colorTween = new ColorTween(begin: QuizzesProperties.colors[0], end: QuizzesProperties.colors[1]);
    backgroundColor = QuizzesProperties.quizzes[0].color;

    setState(() {
      quiz = QuizzesProperties.quizzes[0];
    });

    scrollController = new ScrollController();
    scrollController.addListener(() {
      ScrollPosition position = scrollController.position;
      ScrollDirection direction = position.userScrollDirection;
      int page = (position.pixels ~/ (position.maxScrollExtent/(QuizzesProperties.quizzes.length.toDouble()-1)));
      double pageDo = (position.pixels / (position.maxScrollExtent/(QuizzesProperties.quizzes.length.toDouble()-1)));
      double percent = pageDo - page;

      if (direction == ScrollDirection.reverse) {

        //page begin
        if (QuizzesProperties.quizzes.length-1 < page+1) {
          return;
        }
        colorTween.begin = QuizzesProperties.quizzes[page].color;
        colorTween.end = QuizzesProperties.quizzes[page+1].color;
        setState(() {
          backgroundColor = colorTween.lerp(percent);
          if (percent > 0.5)
            quiz = QuizzesProperties.quizzes[page + 1];
        });

      }else if (direction == ScrollDirection.forward) {

        //+1 begin page end
        if (QuizzesProperties.quizzes.length-1 < page+1) {
          return;
        }
        colorTween.begin = QuizzesProperties.quizzes[page].color;
        colorTween.end = QuizzesProperties.quizzes[page+1].color;
        setState(() {
          backgroundColor = colorTween.lerp(percent);
          if (percent < 0.5)
            quiz = QuizzesProperties.quizzes[page];

        });
      }else {
        return;
      }
    });
  }

  @override
  void dispose(){
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final double _width = MediaQuery.of(context).size.width;

    return new Container(
      decoration: new BoxDecoration(
          color: backgroundColor
      ),
      child: new Scaffold( // Barra
          backgroundColor: Colors.transparent,

          // Barra
          appBar: new AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: new Text("Geography Quiz App", style: TextStyle(color: QuizzesProperties.colors[4])),
            leading: new IconButton(
              //icon: new Icon(CustomIcons.menu), // Icono menu
              icon: new Image.asset("assets/ic_launcher.png", fit: BoxFit.cover, height: 50.0,), // Icono menu
              onPressed: () {},
            ),
            actions: <Widget>[],
          ),

          // Cos
          body: new Container(
            child: new Stack(
              children: <Widget>[
                // CONTENIDOR PRINCIPAL
                new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Contenidor Text
                      new Container(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 50.0, right: 60.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Text Hello John
                            new Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: new Text(
                                "2018 Geography Quiz",
                                style: new TextStyle(
                                    color: QuizzesProperties.colors[4],
                                    fontSize: 30.0
                                ),
                              ),
                            ),
                            new Text(
                              "Try to aswer correctly.",
                              style: new TextStyle(
                                  color: QuizzesProperties.colors[4]
                              ),
                            ),
                            new Text(
                              quiz.getDescription(),
                              style: new TextStyle(
                                  color: QuizzesProperties.colors[4]
                              ),
                            ),
                          ],
                        ),
                      ),
                      // LA CARTA
                      new Container(
                        height: 350.0,
                        width: _width,
                        child: new ListView.builder(
                          itemBuilder: (context, index) {
                            Quiz quiz = QuizzesProperties.quizzes[index];

                            EdgeInsets padding = const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 30.0);
                            return new Padding(
                                padding: padding,
                                // BOX
                                child: new InkWell(
                                  onTap: () =>
                                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage(quiz))),
                                    child: new Container(
                                      decoration: new BoxDecoration(
                                          borderRadius: new BorderRadius.circular(10.0),
                                          boxShadow: [
                                            new BoxShadow(
                                                color: Colors.black.withAlpha(70),
                                                offset: const Offset(3.0, 10.0),
                                                blurRadius: 15.0
                                            )
                                          ]
                                      ),
                                      height: 250.0,
                                      child: new Stack(
                                        children: <Widget>[
                                          new Container(
                                            decoration: new BoxDecoration(
                                              color: new Color(0xDDFFFFFF),
                                              borderRadius: new BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          new Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: new Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                new Expanded(
                                                  child: new Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      new Expanded(
                                                        child: new Container(
                                                            alignment: Alignment.topCenter,
                                                            child: new Image.asset(quiz.icon, fit: BoxFit.cover, ) //etc
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                // Petit marge per a que no quedi apretat
                                                new Padding(padding: const EdgeInsets.only(bottom: 15.0)),
                                                // TITOL
                                                new Padding(
                                                  padding: const EdgeInsets.only(bottom: 20.0),
                                                  child: new Align(
                                                    alignment: Alignment.bottomLeft,
                                                    child: new Material(
                                                      color: Colors.transparent,
                                                      child: new Text(
                                                        quiz.name, // El titol de la carta
                                                        style: new TextStyle(
                                                            fontSize: 30.0,
                                                            color: QuizzesProperties.colors[5]
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                new Align(
                                                    alignment: Alignment.bottomLeft,
                                                    //child: new Hero(
                                                    //    tag: "TAG002",
                                                    child: new Material(
                                                      color: Colors.transparent,
                                                      child: new Row(
                                                        children: <Widget>[
                                                          new Expanded(
                                                            child: new LinearProgressIndicator(
                                                              value: quiz.maximumScore == null ? (0.0): quiz.maximumScore,
                                                              backgroundColor: Colors.grey.withAlpha(50),
                                                              valueColor: new AlwaysStoppedAnimation<Color>(quiz.color),
                                                            ),
                                                          ),
                                                          new Padding(
                                                            padding: const EdgeInsets.only(left: 5.0),
                                                            child: new Text(
                                                                quiz.maximumScore == null ? "0%": quiz.maximumScore.isNaN ? "0%": (quiz.maximumScore*100).round().toString() + "%",
                                                                style: TextStyle(color: QuizzesProperties.colors[5])
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                )
                            );
                          },
                          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                          scrollDirection: Axis.horizontal,
                          physics: new CustomScrollPhysics(),
                          controller: scrollController,
                          itemExtent: _width - 80,
                          itemCount: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }


}

class CustomScrollPhysics extends ScrollPhysics {

  CustomScrollPhysics({ ScrollPhysics parent, }) : super(parent: parent);

  final double numOfItems = 3.0;

  @override
  CustomScrollPhysics applyTo(ScrollPhysics ancestor) {
    return new CustomScrollPhysics(parent: buildParent(ancestor));
  }

  double _getPage(ScrollPosition position) {
    return position.pixels / (position.maxScrollExtent/numOfItems);
  }

  double _getPixels(ScrollPosition position, double page) {
    return page * (position.maxScrollExtent/numOfItems);
  }

  double _getTargetPixels(ScrollPosition position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity)
      page -= 0.5;
    else if (velocity > tolerance.velocity)
      page += 0.5;
    return _getPixels(position, page.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position, double velocity) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels)
      return new ScrollSpringSimulation(spring, position.pixels, target, velocity, tolerance: tolerance);
    return null;
  }

}
