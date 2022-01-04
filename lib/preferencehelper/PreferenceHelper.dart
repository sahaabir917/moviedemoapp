import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static SharedPreferences pref;

  void setIsLoggedIn(bool isLogin) async {
    pref = await SharedPreferences.getInstance();
    pref.setBool("isLogin", isLogin);
    pref.commit();
  }

}