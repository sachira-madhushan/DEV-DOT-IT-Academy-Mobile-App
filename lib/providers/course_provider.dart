import 'dart:convert';
import 'dart:io';

import 'package:dev_dot_academy/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CourseProvider extends ChangeNotifier{

  Map<String,dynamic> _AllCourses=Map();
  Map<String,dynamic> _UserCourses=Map();
  bool? _isLoading=false;

  Map<String,dynamic> get allCourses=>_AllCourses;
  Map<String,dynamic> get userCourses=>_UserCourses;
  get isLoading=>_isLoading;

  Future<void> getAllCourses() async {
    notifyListeners();
    _isLoading=true;
    final response = await http.get(Uri.parse(API.baseUser+"/api/course/all"));
    if (response.statusCode == 200) {
      _AllCourses = json.decode(response.body);
      print(_AllCourses);
    } else {
      throw Exception('Failed to load courses');
    }

    _isLoading=false; 
    notifyListeners();
  }

  Future<void> getUserCourses() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    notifyListeners();
    _isLoading=true;
    final response = await http.get(Uri.parse(API.baseUser+"/api/course/courses/"+pref.getInt("u_id").toString()));
    //+pref.getInt("u_id").toString()

    if (response.statusCode == 200) {
      _UserCourses = json.decode(response.body);
      print(_UserCourses);
    } else {
      throw Exception('Failed to load courses');
    }

    _isLoading=false; 
    notifyListeners();
  }
}