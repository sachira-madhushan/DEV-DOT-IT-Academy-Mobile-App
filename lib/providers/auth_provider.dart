import 'dart:convert';

import 'package:dev_dot_academy/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  bool? _isLoading = false;
  bool? _isUserLoggedIn = false;
  int? _u_id;
  String? _username;

  get isLoading => _isLoading;
  get isUserLoggedIn => _isUserLoggedIn;
  get u_id=>_u_id;
  get username=>_username;

  void userCheck()async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    _u_id=pref.getInt("u_id")!;
    getCurrentUser();
    notifyListeners();
  }

  void setUserLoggedIn(int u_id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setBool("isUserLoggedIn", true);
    pref.setInt("u_id", u_id);

    _isUserLoggedIn = pref.getBool("isUserLoggedIn")!;
    _u_id = pref.getInt("u_id")!;

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
        setUserLoggedIn(jsonData['u_id']);
      }
      print(response.statusCode);
      
    }
    _isLoading = false;
    notifyListeners();
    print(result);
    return result;
  }


  Future<void> getCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _isLoading=true;
    _u_id=pref.getInt("u_id");
    final response = await http.get(Uri.parse(API.baseUser+"/api/user/"+_u_id.toString()));
    print(response.body);
    if (response.statusCode == 200) {
       final jsonData = json.decode(response.body);
        _username=jsonData['user']['u_fullname'];
    } else {
      throw Exception('Failed to load users');
    }
    _isLoading=false;
    notifyListeners();
  
  }

  void setUserLoggedOut()async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    pref.setBool("isUserLoggedIn", false);
    notifyListeners();
  }

}
