import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Course extends StatefulWidget {
  const Course(
      {super.key,
      required this.banner,
      required this.instructor,
      required this.price,
      required this.title});
  final String banner;
  final String title;
  final String instructor;
  final String price;
  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 300,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(widget.banner)),
            Text(
              widget.title,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("By " + widget.instructor,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 92, 92, 92)))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Rs." + widget.price,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 92, 92, 92))))
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(33, 0, 0, 0),
                blurRadius: 5,
              )
            ]),
      ),
    );
  }
}
