import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class DataSaver {

  static saveData(String quiz, double newScore) async {
    // obtain shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // set value
    prefs.setDouble(quiz, newScore);
  }

  static Future<double> readData(String quiz) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Try reading data from the counter key. If it does not exist, return 0.
    double data = prefs.getDouble(quiz) ?? 0.0;

    if (data.isNaN | data.isInfinite)
      data = 0.0;

    return data;
  }

  static printData() async {
    final prefs = await SharedPreferences.getInstance();
    print("KEYS");
    for (String key in prefs.getKeys()){
      print(key + " --> " + prefs.getDouble(key).toString());
      if (prefs.getDouble(key).isInfinite){
        prefs.setDouble(key, 0.0);
      }
    }
  }
}
