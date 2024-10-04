import 'package:dev_dot_academy/components/course.dart';
import 'package:dev_dot_academy/components/primary_button.dart';
import 'package:dev_dot_academy/components/search_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  TextEditingController search = TextEditingController();
  final List<CourseData> courses = [
    CourseData(
      banner: "https://www.oyolloo.com/wp-content/uploads/2023/12/What-Is-Game-Development-1024x576.jpg",
      instructor: "Sachira Madhushan",
      price: "2000",
      title: "Game Development Full Courses",
    ),
    CourseData(
      banner: "https://www.oyolloo.com/wp-content/uploads/2023/12/What-Is-Game-Development-1024x576.jpg",
      instructor: "Sachira Madhushan",
      price: "2000",
      title: "Advanced Game Development",
    ),
    CourseData(
      banner: "https://www.oyolloo.com/wp-content/uploads/2023/12/What-Is-Game-Development-1024x576.jpg",
      instructor: "Sachira Madhushan",
      price: "2000",
      title: "Game Design Fundamentals",
    ),
    // Add more courses as needed
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
            expandedHeight: 320.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("My Courses", style: TextStyle(color: Color.fromARGB(255, 67, 67, 67), fontSize:18),textAlign:TextAlign.center,),
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:AssetImage("assets/images/logo_squire.png"),

                  ),
                  SizedBox(height: 10),
                  Text("Full Name", style: TextStyle(color: Color.fromARGB(255, 67, 67, 67), fontSize: 22)),
                  Text("Dev Dot Academy", style: TextStyle(color: const Color.fromARGB(255, 123, 123, 123), fontSize: 16)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width:double.infinity,
                      
                      decoration: BoxDecoration(color: Colors.red),
                      child: TextButton(onPressed:(){}, child:Text("Logout",style:TextStyle(color: Colors.white),))),
                  )
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Course(
                        banner: courses[index].banner,
                        instructor: courses[index].instructor,
                        price: courses[index].price,
                        title: courses[index].title,
                      );
              },
              childCount: courses.length, // Number of list items
            ),
          ),
      ]
    );
  }
}

class CourseData {
  final String banner;
  final String instructor;
  final String price;
  final String title;

  CourseData({
    required this.banner,
    required this.instructor,
    required this.price,
    required this.title,
  });
}