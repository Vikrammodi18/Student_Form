import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken({
    required String name,
    required String data,
  }) async {
    await _prefs.setString(name, data);
  }

  static String? getToken({required String name}) {
    return _prefs.getString(name);
  }

  static Future<void> removeToken({required String name}) async {
    await _prefs.remove(name);
  }

  static Future<void> setLogin(bool value) async {
    await _prefs.setBool("isLoggedIn", value);
  }

  static bool getLogin() {
    return _prefs.getBool("isLoggedIn") ?? false;
  }

  static Future<void> clearLogin() async {
    await _prefs.remove("isLoggedIn");
  }
}

void showSnackBar({required String message, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: Colors.deepPurple, content: Text(message)),
  );
}
