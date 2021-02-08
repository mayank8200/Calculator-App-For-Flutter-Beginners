import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String inp = "0";
  String out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String op = "";

  Widget createButton(String btnText) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(border: Border.all(width: 1)),
          child: MaterialButton(
            onPressed: () => onButtonClick(btnText),
            child: Text(
              btnText,
              style: TextStyle(fontSize: 35),
            ),
            padding: EdgeInsets.all(20),
          )),
    );
  }

  void onButtonClick(String btnText) {
    if (btnText == "CLEAR") {
      out = "0";
      num1 = 0.0;
      num2 = 0.0;
      op = "";
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'X' ||
        btnText == '/') {
      num1 = double.parse(inp);
      op = btnText;
      out = "0";
    } else if (btnText == ".") {
      if (out.contains(".")) {
        print("It's already a decimal");
        return;
      } else {
        out = out + btnText;
      }
    } else if (btnText == "=") {
      num2 = double.parse(inp);
      if (op == "+") {
        out = (num1 + num2).toString();
      }
      if (op == "-") {
        out = (num1 - num2).toString();
      }
      if (op == "X") {
        out = (num1 * num2).toString();
      }
      if (op == "/") {
        out = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      inp = '0';
    }
    else
    {
      out = out + btnText;
    }

    setState(() {
      inp = double.parse(out).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              alignment: Alignment.centerRight,
              //decoration: BoxDecoration(border: Border.all(width: 3)),
              child: Text(
                inp,
                style: TextStyle(fontSize: 80),
              ),
            ),
            Expanded(
                child: Divider(
              color: Colors.amber,
            )),
            Row(
              children: [
                createButton('7'),
                createButton('8'),
                createButton('9'),
                createButton('/'),
              ],
            ),
            Row(
              children: [
                createButton('4'),
                createButton('5'),
                createButton('6'),
                createButton('X'),
              ],
            ),
            Row(
              children: [
                createButton('1'),
                createButton('2'),
                createButton('3'),
                createButton('-'),
              ],
            ),
            Row(
              children: [
                createButton('.'),
                createButton('0'),
                createButton('00'),
                createButton('+'),
              ],
            ),
            Row(children: [createButton('CLEAR'), createButton('=')]),
          ],
        ),
      ),
    );
  }
}
