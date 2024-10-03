import 'package:dev_dot_academy/components/course.dart';
import 'package:dev_dot_academy/components/search_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AllCourses extends StatefulWidget {
  const AllCourses({super.key});

  @override
  State<AllCourses> createState() => _AllCoursesState();
}

class _AllCoursesState extends State<AllCourses> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Container(
                color: Colors.green,
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Image.asset(
                        "assets/images/logo.png",
                        width: 130,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Text(
                        "Dev Dot Academy",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                      Center(
                          child: Text(
                        "Discover Our Online Courses ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 200,
                child: SearchBox(
                    prefixImage: Icon(Icons.search),
                    placeholder: "Search courses",
                    controller: search)),
            Positioned(
              top: 270,
              left: 0,
              right: 0,
              bottom: 0,
              child: Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Course(
                          banner:
                              "https://www.oyolloo.com/wp-content/uploads/2023/12/What-Is-Game-Development-1024x576.jpg",
                          instructor: "Sachira Madhushan",
                          price: "2000",
                          title: "Game Development Full Courses",
                        ),
                        Course(
                          banner:
                              "https://www.oyolloo.com/wp-content/uploads/2023/12/What-Is-Game-Development-1024x576.jpg",
                          instructor: "Sachira Madhushan",
                          price: "2000",
                          title: "Game Development Full Courses",
                        ),
                        Course(
                          banner:
                              "https://www.oyolloo.com/wp-content/uploads/2023/12/What-Is-Game-Development-1024x576.jpg",
                          instructor: "Sachira Madhushan",
                          price: "2000",
                          title: "Game Development Full Courses",
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
