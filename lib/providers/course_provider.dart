import 'dart:convert';
import 'dart:io';

import 'package:dev_dot_academy/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CourseProvider extends ChangeNotifier {
  Map<String, dynamic> _AllCourses = Map();
  Map<String, dynamic> _UserCourses = Map();
  Map<String, dynamic> _course = Map();
  Map<String, dynamic> _enrollment = Map();

  bool? _isLoading = false;
  bool? _hasAccess = false;

  Map<String, dynamic> get allCourses => _AllCourses;
  Map<String, dynamic> get userCourses => _UserCourses;
  Map<String, dynamic> get course => _course;

  get hasAccess => _hasAccess;

  get isLoading => _isLoading;

  Future<void> getAllCourses() async {
    notifyListeners();
    _isLoading = true;
    final response =
        await http.get(Uri.parse(API.baseUser + "/api/course/all"));
    if (response.statusCode == 200) {
      _AllCourses = json.decode(response.body);
      print(_AllCourses);
    } else {
      throw Exception('Failed to load courses');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getUserCourses() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    notifyListeners();
    _isLoading = true;
    final response = await http.get(Uri.parse(API.baseUser +
        "/api/course/courses/" +
        pref.getInt("u_id").toString()));

    if (response.statusCode == 200) {
      _UserCourses = json.decode(response.body);
      print(_UserCourses);
    } else {
      throw Exception('Failed to load courses');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getCourseByID(int courseID) async {
    notifyListeners();
    _isLoading = true;
    final response = await http.get(
        Uri.parse(API.baseUser + "/api/course/course/" + courseID.toString()));

    if (response.statusCode == 200) {
      _course = json.decode(response.body);
      print(_course);
    } else {
      throw Exception('Failed to load course');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> checkEnrollment(int userID, int courseID) async {

    print("Has Access"+userID.toString()+" "+courseID.toString());
    notifyListeners();
    try {
      
      final response = await http.post(
        Uri.parse(API.baseUser + "/api/course/check"),
        headers:<String,String>{
           'Content-Type': 'application/json',
           "Accept": "application/json"
        },
        body: json.encode({
          "u_id": "31",
          "c_id": "8",
        })
      );

      if (response.statusCode == 200) {
        _enrollment = json.decode(response.body);
        print("Has Access"+_enrollment.toString());
        if(_enrollment['data'][0]['count']==1){
          _hasAccess = true;
        }else{
          _hasAccess = false;
        }
      } else {
        
        throw Exception('Failed to load course');
      }
    } catch (error) {
      print("Has Access"+error.toString());
    } finally {
      notifyListeners();
    }
  }
}
