import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
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
  String expo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  expo,
                  textScaleFactor: 2,
                ),
              ),
              Row(

                children: [
                  Expanded(
                      child: FlatButton(

                          onPressed: () => ac(),
                          child: Text("AC", textScaleFactor: 2))),
                  Expanded(
                      child: FlatButton(
                          onPressed: () => calculatorButton("^(1/2)"),
                          child: Text("^2", textScaleFactor: 2))),
                  Expanded(
                      child: FlatButton(
                          onPressed: () => calculatorButton("%"),
                          child: Text("%", textScaleFactor: 2))),
                  Expanded(
                      child: FlatButton(
                          onPressed: () => calculatorButton("/"),
                          child: Text("/", textScaleFactor: 2))),
                ],
              ),
              Row(


                children: [
                  Expanded(
                    child: FlatButton(
                        onPressed: () => calculatorButton("7"),
                        child: Text("7", textScaleFactor: 2)),
                  ),
                  Expanded(
                    child: FlatButton(
                        onPressed: () => calculatorButton("8"),
                        child: Text("8", textScaleFactor: 2)),
                  ),
                  Expanded(
                    child: FlatButton(
                        onPressed: () => calculatorButton("9"),
                        child: Text("9", textScaleFactor: 2)),
                  ),
                  Expanded(
                    child: FlatButton(
                        onPressed: () => calculatorButton("*"),
                        child: Text("X", textScaleFactor: 2)),
                  )
                ],
              ),
              Row(

                children: [
                  Expanded(
                    child: FlatButton(
                        onPressed: () => calculatorButton("4"),
                        child: Text("4", textScaleFactor: 2)),
                  ),
                  Expanded(
                    child: FlatButton(
                        onPressed: () => calculatorButton("5"),
                        child: Text("5", textScaleFactor: 2)),
                  ),
                  Expanded(
                    child: FlatButton(
                        onPressed: () => calculatorButton("6"),
                        child: Text("6", textScaleFactor: 2)),
                  ),
                  Expanded(
                    child:FlatButton(
                      onPressed: () => calculatorButton("-"),
                      child: Text("-", textScaleFactor: 2))),
                ],
              ),
              Row(

                children: [
                  Expanded(
                      child: FlatButton(
                          onPressed: () => calculatorButton("1"),
                          child: Text("1", textScaleFactor: 2))),
                  Expanded(
                      child: FlatButton(
                          onPressed: () => calculatorButton("2"),
                          child: Text("2", textScaleFactor: 2))),
                  Expanded(
                      child: FlatButton(
                          onPressed: () => calculatorButton("3"),
                          child: Text("3", textScaleFactor: 2))),
                  Expanded(
                      child: FlatButton(
                          onPressed: () => calculatorButton("+"),
                          child: Text("+", textScaleFactor: 2))),
                ],
              ),
              Row(

                children: [
                  Expanded(
                      child: FlatButton(
                          onPressed: () => calculatorButton("0"),
                          child: Text("0", textScaleFactor: 2))),
                  Expanded(
                      child: FlatButton(
                          onPressed: () => calculatorButton("."),
                          child: Text(".", textScaleFactor: 2))),
                  Expanded(
                      child: FlatButton(
                          onPressed: () => deleteChar(),
                          child: Text("<-", textScaleFactor: 2))),
                  Expanded(
                      child: FlatButton(
                          onPressed: () => calculate(),
                          child: Text("=", textScaleFactor: 2))),
                ],
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
}
