import 'dart:convert';

import 'package:dev_dot_academy/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthProvide extends ChangeNotifier {
  bool? _isLoading = false;
  bool? _isUserLoggedIn = false;
  int? _userID;

  get isLoading => _isLoading;
  get isUserLoggedIn => _isUserLoggedIn;
  get userID=>_userID;

  void setUserLoggedIn(int userID) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setBool("isUserLoggedIn", true);
    pref.setInt("userID", userID);

    _isUserLoggedIn = pref.getBool("isUserLoggedIn")!;
    _userID = pref.getInt("userID")!;
    notifyListeners();
  }

  Future<bool> logInUser(String email, String password) async {
    notifyListeners();
    _isLoading = true;
    bool result = true;
    if (email == "" || password == "") {
      result = false;
    }

    if (result) {
      final response = await http.post(
        Uri.parse(API.baseUser+"/api/user/login"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'u_email': email, "u_password": password}),
      );
      if (response.statusCode == 500) {
        result = false;
      }
      print(response.statusCode);
    }
    _isLoading = false;
    notifyListeners();
    print(result);
    return result;
  }
}
