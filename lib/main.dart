import 'package:flutter/material.dart';

void main() => runApp(Calculadora());

class Calculadora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculadora',
        theme: ThemeData(primarySwatch: Colors.green),
        home: TelaCalc());
  }
}

class TelaCalc extends StatefulWidget {
  @override
  StateCalculadora createState() => StateCalculadora();
}

class StateCalculadora extends State<TelaCalc> {
  double x = 0;
  double y = 0;
  String op = "";
  String resultado = "0";

  void botaoPress(String textoBotao) {
    setState(() {
      if (textoBotao == "C") {
        resultado = "0";
        x = 0;
        y = 0;
        op = "";
      } else if (textoBotao == "+" || textoBotao == "-" || textoBotao == "*" || textoBotao == "/") {
        y = double.tryParse(resultado) ?? 0;
        op = textoBotao;
        resultado = "0";
      } else if (textoBotao == "=") {
        double _numero2 = double.tryParse(resultado) ?? 0;
        switch (op) {
          case "+":
            resultado = (y + _numero2).toString();
            break;
          case "-":
            resultado = (y - _numero2).toString();
            break;
          case "*":
            resultado = (y * _numero2).toString();
            break;
          case "/":
            resultado = _numero2 != 0 ? (y / _numero2).toString() : "Error";
            break;
        }
        y = 0;
        op = "";
      } else {
        if (resultado == "0") {
          resultado = textoBotao;
        } else {
          resultado += textoBotao;
        }
      }
    });
  }

  Widget ConstruirB(String texto) {
    return Expanded(
      child: OutlinedButton(
        child: Text(
          texto,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
        ),
        onPressed: () => botaoPress(texto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora')),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 14.0),
              child: Text(
                resultado,
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(children: [
              Row(children: [
                ConstruirB("7"),
                ConstruirB("8"),
                ConstruirB("9"),
                ConstruirB("/")
              ]),
              Row(children: [
                ConstruirB("4"),
                ConstruirB("5"),
                ConstruirB("6"),
                ConstruirB("*")
              ]),
              Row(children: [
                ConstruirB("1"),
                ConstruirB("2"),
                ConstruirB("3"),
                ConstruirB("-")
              ]),
              Row(children: [
                ConstruirB("."),
                ConstruirB("0"),
                ConstruirB("00"),
                ConstruirB("+")
              ]),
              Row(children: [
                ConstruirB("C"),
                ConstruirB("="),
              ])
            ])
          ],
        ),
      ),
    );
  }
}
