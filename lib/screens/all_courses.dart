import 'package:dev_dot_academy/components/course.dart';
import 'package:dev_dot_academy/components/search_box.dart';
import 'package:dev_dot_academy/providers/course_provider.dart';
import 'package:dev_dot_academy/screens/course_view.dart';
import 'package:dev_dot_academy/utils/navigate_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class AllCourses extends StatefulWidget {
  const AllCourses({super.key});

  @override
  State<AllCourses> createState() => _AllCoursesState();
}

class _AllCoursesState extends State<AllCourses> {
  TextEditingController search = TextEditingController();
  
   @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CourseProvider>(context, listen: false).getAllCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> courses=Provider.of<CourseProvider>(context).allCourses;
    bool isLoading=Provider.of<CourseProvider>(context).isLoading;

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
              child: Container(
                child: Expanded(
                  child: 
                  isLoading?
                  Shimmer.fromColors(
                    enabled: true,
                    child:
                  ListView.builder(
                  itemCount:5,
                  itemBuilder: (context, index) {
                    return Course(
                      banner:"",
                      instructor: "",
                      price: "",
                      title: "",
                    );
                  },
                  )
                  , baseColor: Colors.grey.shade300, highlightColor:  Colors.grey.shade100,)
                  
                  :
                  
                  ListView.builder(
                  itemCount:courses.isEmpty ? 0:courses['course'].length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        NavigateUtils.navigateTo(context, CourseView(couresID:courses['course'][index]['c_id']));
                      },
                      child: Course(
                        banner: courses['course'][index]['c_banner'],
                        instructor: courses['course'][index]['c_instructor'],
                        price: courses['course'][index]['c_price'].toString(),
                        title: courses['course'][index]['c_title'],
                      ),
                    );
                  },
                  ),
                ),
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
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