import 'package:dev_dot_academy/models/course_chapter_model.dart';

class CourseModel {
  final int c_id;
  final String c_title;
  final String c_description;
  final double c_price;
  final String c_instructor;
  final String c_banner;
  final String c_intro;

  CourseModel({required this.c_title, required this.c_id, required this.c_description,required this.c_instructor,required this.c_price,required this.c_banner,required this.c_intro});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      c_id: json['c_id'],
      c_title: json['c_title'],
      c_description: json['c_description'],
      c_price:json['c_price'],
      c_instructor: json['c_instructor'],
      c_banner: json['c_banner'],
      c_intro: json['c_intro'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'c_id': c_id,
      'c_title': c_title,
      'c_description':c_description,
      'c_price':c_price,
      'c_instructor': c_instructor,
      'c_banner': c_banner,
      'c_intro': c_intro,
    };
  }
}