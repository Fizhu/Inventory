import 'dart:convert';

import 'package:inventory/data/models/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  static const _PREF_STATUS = 'keyStatus';
  static const _PREF_USER = 'keyUser';

  static setStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_PREF_STATUS, true);
  }

  static Future<bool> getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_PREF_STATUS) ?? false;
  }

  static setUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_USER, json.encode(user));
  }

  static Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return User.fromJson(json.decode(prefs.getString(_PREF_USER)));
  }

  static clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_PREF_STATUS);
    prefs.remove(_PREF_USER);
  }
}
