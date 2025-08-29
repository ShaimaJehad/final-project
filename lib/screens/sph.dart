import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPrefHelper? _incstance ;
  // Obtain shared preferences.
  late SharedPreferences prefs;

  SharedPrefHelper._init();

  factory SharedPrefHelper (){
    return _incstance ??=SharedPrefHelper._init();
  }

  initPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setData(value) async {
    return await prefs.setString("token", value);
  }

  String getData(){
    return prefs.getString("token") ?? '';
  }


}