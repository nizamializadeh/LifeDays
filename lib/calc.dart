import 'package:life_days/user-data.dart';

class Calc {
  UserData _userData;
  Calc(this._userData);
  double hesaplama() {
    double result;

    result = 90 + _userData.gymCount - _userData.smokeCount;
    result = result + (_userData.boy / _userData.weight);
    if (_userData.selectGender == "Qadın") {
      return result + 3;
    } else {
      return result;
    }
  }
}
