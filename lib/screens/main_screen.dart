import 'package:dev_dot_academy/screens/all_courses.dart';
import 'package:dev_dot_academy/screens/my_courses.dart';
import 'package:dev_dot_academy/utils/color_utils.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens=[MyCourses(),AllCourses()];
  int screenIndex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[screenIndex],
      bottomNavigationBar:Container(
        child: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon:Icon(Icons.book_sharp),label:"My Courses"),
        BottomNavigationBarItem(icon:Icon(Icons.list),label:"All Courses"),
        //BottomNavigationBarItem(icon:Icon(Icons.person_2),label:"Profile"),
      ],
      onTap: (value) {
        setState(() {
          screenIndex=value;
        });
      },
      currentIndex: screenIndex,
      selectedItemColor: ColorUtils.primary,
      
      iconSize:30,
      backgroundColor: Colors.white,
      
      ),)
    );
  }
}