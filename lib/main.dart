import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_days/Const.dart';
import 'package:life_days/Icongender.dart';
import 'package:life_days/mycontainer.dart';
import 'package:life_days/result_page.dart';
import 'package:life_days/user-data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue[300],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Life Days'),
          centerTitle: true,
        ),
        body: InputPage(),
      ),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String selectGender = 'Kişi';
  double smokeCount = 15;
  double gymCount = 3;
  int boy = 170;
  int weight = 45;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: MyContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'BOY',
                          style: kTextStl,
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          boy.toString(),
                          style: kNumStl,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonTheme(
                            minWidth: 36,
                            child: OutlineButton(
                                borderSide: BorderSide(color: Colors.lightBlue),
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  setState(() {
                                    boy++;
                                  });
                                }),
                          ),
                          ButtonTheme(
                            minWidth: 36,
                            child: OutlineButton(
                                borderSide: BorderSide(color: Colors.lightBlue),
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  setState(() {
                                    boy--;
                                  });
                                }),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MyContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'CEKI',
                          style: kTextStl,
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          weight.toString(),
                          style: kNumStl,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonTheme(
                            minWidth: 36,
                            child: OutlineButton(
                                borderSide: BorderSide(color: Colors.lightBlue),
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ),
                          ButtonTheme(
                            minWidth: 36,
                            child: OutlineButton(
                                borderSide: BorderSide(color: Colors.lightBlue),
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: MyContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gunde nece dene siqaret chekirsiniz?',
                  style: kTextStl,
                ),
                Text(
                  '${smokeCount.round()}',
                  style: kNumStl,
                ),
                Slider(
                    min: 0,
                    max: 30,
                    value: smokeCount,
                    onChanged: (double newValue) {
                      setState(() {
                        smokeCount = newValue;
                      });
                    })
              ],
            ),
          ),
        ),
        Expanded(
          child: MyContainer(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Heftede nece defe idman edirsiniz?',
                style: kTextStl,
              ),
              Text(
                '${gymCount.round()}',
                style: kNumStl,
              ),
              Slider(
                  min: 0,
                  max: 30,
                  value: gymCount,
                  onChanged: (double newValue) {
                    setState(() {
                      gymCount = newValue;
                    });
                  })
            ],
          )),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: MyContainer(
                  OnPress: () {
                    setState(() {
                      selectGender = 'Qadın';
                    });
                  },
                  clr: selectGender == 'Qadın' ? Colors.blue : Colors.white,
                  child: MyColumn(
                    gender: "Qadın",
                    icn: FontAwesomeIcons.venus,
                  ),
                ),
              ),
              Expanded(
                child: MyContainer(
                  OnPress: () {
                    setState(() {
                      selectGender = 'Kişi';
                    });
                  },
                  clr: selectGender == 'Kişi' ? Colors.blue : Colors.white,
                  child: MyColumn(
                    gender: "Kişi",
                    icn: FontAwesomeIcons.mars,
                  ),
                ),
              ),
            ],
          ),
        ),
        ButtonTheme(
          height: 50,
          child: FlatButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(UserData(
                            weight: weight,
                            boy: boy,
                            selectGender: selectGender,
                            smokeCount: smokeCount,
                            gymCount: gymCount))));
              },
              child: Text(
                'Hesabla',
                style: kTextStl,
              )),
        )
      ],
    );
  }
}
