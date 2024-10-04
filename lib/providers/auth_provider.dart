import 'dart:convert';

import 'package:dev_dot_academy/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  bool? _isLoading = false;
  bool? _isUserLoggedIn = false;
  String? _token;

  get isLoading => _isLoading;
  get isUserLoggedIn => _isUserLoggedIn;
  get token=>_token;

  void setUserLoggedIn(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setBool("isUserLoggedIn", true);
    pref.setString("token", token);

    _isUserLoggedIn = pref.getBool("isUserLoggedIn")!;
    _token = pref.getString("token")!;

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
      if (response.statusCode == 500 || response.statusCode==401) {
        result = false;
        
      }else{
        final jsonData=jsonDecode(response.body);
        setUserLoggedIn(jsonData['token']);
      }
      print(response.statusCode);
      
    }
    _isLoading = false;
    notifyListeners();
    print(result);
    return result;
  }

}
