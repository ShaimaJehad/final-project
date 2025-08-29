// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPrefController {
//    late SharedPreferences prefs ;
//    SharedPrefController._init();
//    static SharedPrefController? _instance;

//    factory SharedPrefController(){
//      return _instance??=SharedPrefController._init();
//    }

//   initPref() async {
//     prefs = await SharedPreferences.getInstance();
//   }

//   Future<bool> setData({key,value}) async {
//      if(value is int){
//        return await prefs.setInt(key, value);
//      }else if(value is double){
//        return await prefs.setDouble(key, value);
//      }else if(value is bool){
//        return await prefs.setBool(key, value);
//      }else if(value is String){
//        return await prefs.setString(key, value);
//      }
//      return false;
//   }

//   // getInt({key}){
//   //    return prefs.getInt(key);
//   // }

//   T? getData<T>({key}){
//      return prefs.get(key) as T?;
//   }


//   Future<bool> remove({key}) async {
//     return await prefs.remove(key);
//   }

//    Future<bool> clear() async {
//      return await prefs.clear();
//    }

// }