import 'package:dev_dot_academy/components/course.dart';
import 'package:dev_dot_academy/components/primary_button.dart';
import 'package:dev_dot_academy/components/search_box.dart';
import 'package:dev_dot_academy/providers/auth_provider.dart';
import 'package:dev_dot_academy/providers/course_provider.dart';
import 'package:dev_dot_academy/screens/splash_screen.dart';
import 'package:dev_dot_academy/utils/navigate_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CourseProvider>(context, listen: false).getUserCourses();
      Provider.of<AuthProvider>(context, listen: false).getCurrentUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> courses =
        Provider.of<CourseProvider>(context, listen: false).userCourses;
    bool isLoading = Provider.of<CourseProvider>(context).isLoading;

    return CustomScrollView(slivers: [
      SliverAppBar(
        centerTitle: true,
        expandedHeight: 320.0,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            "My Courses",
            style:
                TextStyle(color: Color.fromARGB(255, 67, 67, 67), fontSize: 18),
            textAlign: TextAlign.center,
          ),
          background: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/logo_squire.png"),
              ),
              SizedBox(height: 10),
              Text(
                  Provider.of<AuthProvider>(context, listen: false).isLoading
                      ? "No Data"
                      : Provider.of<AuthProvider>(context, listen: false)
                          .username,
                  style: TextStyle(
                      color: Color.fromARGB(255, 67, 67, 67), fontSize: 22)),
              Text("Dev Dot Academy",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 123, 123, 123),
                      fontSize: 16)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.red),
                    child: TextButton(
                        onPressed: () {
                          Provider.of<AuthProvider>(context, listen: false)
                              .setUserLoggedOut();
                          NavigateUtils.navigateToAndRemove(
                              context, SplashScreen());
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                        ))),
              )
            ],
          ),
        ),
      ),
      isLoading
          ? SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Shimmer.fromColors(
                    enabled: true,
                    child: Course(
                      banner: "",
                      instructor: "",
                      price: "",
                      title: "",
                    ),
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                  );
                },
                childCount: 5,
              ),
            )
          : SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Course(
                    banner: courses['course'][index]['c_banner'],
                    instructor: courses['course'][index]['c_instructor'],
                    price: courses['course'][index]['c_price'].toString(),
                    title: courses['course'][index]['c_title'],
                  );
                },
                childCount: courses.isEmpty ? 0 : courses['course'].length,
              ),
            ),
    ]);
  }
}
