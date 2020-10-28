import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_) => runApp(Calculator()),
  );
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}




class _AnaSayfaState extends State<AnaSayfa> {
  bool expend = false;
  String expo = "";

  @override
  Widget build(BuildContext context) {
    return expend ? buildcomplex() : buildbasic();
  }

  Scaffold buildbasic() {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Expanded(
                flex: 2,
                child: Container(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      getExpString(expo),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      textScaleFactor: 2
                      ,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              ButtonTheme(
                  height: 20,
                  minWidth: double.maxFinite,
                  child: FlatButton(

                      onPressed: () {
                        setState(() {
                          expend = true;
                        });
                      },
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_forward_ios,size: 50,)))),
              Expanded(
                flex: 3,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                  Row(
                    children: [
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => ac(),
                                  child: Text("AC", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("^(1/2)"),
                                  child: Text("^2", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("%"),
                                  child: Text("%", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("/"),
                                  child: Text("/", textScaleFactor: 2)))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                                onPressed: () => calculatorButton("7"),
                                child: Text("7", textScaleFactor: 2))),
                      ),
                      Expanded(
                        child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                                onPressed: () => calculatorButton("8"),
                                child: Text("8", textScaleFactor: 2))),
                      ),
                      Expanded(
                        child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                                onPressed: () => calculatorButton("9"),
                                child: Text("9", textScaleFactor: 2))),
                      ),
                      Expanded(
                        child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                                onPressed: () => calculatorButton("*"),
                                child: Text("X", textScaleFactor: 2))),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                                onPressed: () => calculatorButton("4"),
                                child: Text("4", textScaleFactor: 2))),
                      ),
                      Expanded(
                        child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                                onPressed: () => calculatorButton("5"),
                                child: Text("5", textScaleFactor: 2))),
                      ),
                      Expanded(
                        child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                                onPressed: () => calculatorButton("6"),
                                child: Text("6", textScaleFactor: 2))),
                      ),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("-"),
                                  child: Text("-", textScaleFactor: 2)))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("1"),
                                  child: Text("1", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("2"),
                                  child: Text("2", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("3"),
                                  child: Text("3", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("+"),
                                  child: Text("+", textScaleFactor: 2)))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("0"),
                                  child: Text("0", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("."),
                                  child: Text(".", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => deleteChar(),
                                  child: Text("<-", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculate(),
                                  child: Text("=", textScaleFactor: 2,style: TextStyle(color: Colors.orange))))),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
//  operators will change
  Scaffold buildcomplex() {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 20),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 300,
                    child: Text(
                      getExpString(expo),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      textScaleFactor: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              ButtonTheme(
                  height: 20,
                  minWidth: double.maxFinite,
                  child: FlatButton(

                      onPressed: () {
                        setState(() {
                          expend = false;
                        });
                      },
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_back_ios,size: 50,color: Colors.orangeAccent,)))),
              Expanded(
                flex: 3,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                  Row(
                    children: [
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => ac(),
                                  child: Text("AC", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("("),
                                  child: Text("(", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton(")"),
                                  child: Text(")", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("^"),
                                  child: Text("^", textScaleFactor: 2)))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                                onPressed: () => calculatorButton("7"),
                                child: Text("7", textScaleFactor: 2))),
                      ),
                      Expanded(
                        child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                                onPressed: () => calculatorButton("8"),
                                child: Text("8", textScaleFactor: 2))),
                      ),
                      Expanded(
                        child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                                onPressed: () => calculatorButton("9"),
                                child: Text("9", textScaleFactor: 2))),
                      ),
                      Expanded(
                        child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                                onPressed: () => calculatorButton("cos"),
                                child: Text("cos", textScaleFactor: 2))),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                                onPressed: () => calculatorButton("4"),
                                child: Text("4", textScaleFactor: 2))),
                      ),
                      Expanded(
                        child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                                onPressed: () => calculatorButton("5"),
                                child: Text("5", textScaleFactor: 2))),
                      ),
                      Expanded(
                        child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                                onPressed: () => calculatorButton("6"),
                                child: Text("6", textScaleFactor: 2))),
                      ),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("sin"),
                                  child: Text("sin", textScaleFactor: 2)))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("1"),
                                  child: Text("1", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("2"),
                                  child: Text("2", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("3"),
                                  child: Text("3", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("tan"),
                                  child: Text("tan", textScaleFactor: 2)))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("0"),
                                  child: Text("0", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculatorButton("."),
                                  child: Text(".", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => deleteChar(),
                                  child: Text("<-", textScaleFactor: 2)))),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: FlatButton(
                                  onPressed: () => calculate(),
                                  child: Text("=", textScaleFactor: 2,style: TextStyle(color: Colors.orange),)))),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ac() {
    setState(() {
      expo = "";
    });
  }

  calculatorButton(String s) {
    setState(() {
      expo = expo + s;
    });
  }

  calculate() {
    Expression exp;
    Parser p = Parser();
    ContextModel cm = ContextModel();
    try {
      exp = p.parse(expo);
    } catch (e) {
      setState(() {
        expo = "wrong expression";
      });
    }

    setState(() {
      if (exp != null) {
        expo = exp.evaluate(EvaluationType.REAL, cm).toString();
      }
    });
  }

  deleteChar() {
    setState(() {
      expo = expo.substring(0, expo.length - 1);
    });
  }

  String getExpString(String expo) {
    int size = expo.length;
    return expo.length > 100 ? "..." + expo.substring(size - 100, size) : expo;
  }
}
