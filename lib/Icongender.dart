import 'package:flutter/material.dart';
import 'package:life_days/Const.dart';

class MyColumn extends StatelessWidget {
  final String gender;
  final IconData icn;
  MyColumn({this.icn, this.gender});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icn,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 5,
        ),
        Text(gender, style: kTextStl),
      ],
    );
  }
}
