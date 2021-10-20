import 'package:flutter/material.dart';
import 'package:life_days/Const.dart';
import 'package:life_days/calc.dart';
import 'package:life_days/user-data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 8,
              child: Center(
                child: Text(
                  Calc(_userData).hesaplama().round().toString(),
                  style: kTextStl,
                ),
              )),
          Expanded(
              flex: 1,
              child: FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back',
                  style: kTextStl,
                ),
              )),
        ],
      ),
    );
  }
}
