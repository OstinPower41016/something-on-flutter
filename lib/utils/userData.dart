import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

getUserData() async {
  final prefs = await SharedPreferences.getInstance();
  final userData =  prefs.getString("user_info");

  return userData;
} 

setUserData(Map<String, String> data) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString("user_info", jsonEncode(data));
}