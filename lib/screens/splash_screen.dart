import 'package:animate_do/animate_do.dart';
import 'package:dev_dot_academy/screens/login.dart';
import 'package:dev_dot_academy/utils/navigate_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

@override
class _SplashScreenState extends State<SplashScreen> {
  
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      NavigateUtils.navigateToAndRemove(context, Login());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FadeIn(
            duration: Duration(seconds: 5),
            child: Image.asset(
              "assets/images/logo.png",
              width: 200,
            )),
      ),
    );
  }
}
