import 'package:animate_do/animate_do.dart';
import 'package:dev_dot_academy/providers/auth_provider.dart';
import 'package:dev_dot_academy/screens/login_screen.dart';
import 'package:dev_dot_academy/screens/main_screen.dart';
import 'package:dev_dot_academy/utils/navigate_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

@override
class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;
  void initState() {
    checkLoggedIn();
    Future.delayed(Duration(seconds: 5), () {
      isLoggedIn
          ? {
              Provider.of<AuthProvider>(context,listen: false).getCurrentUser(),
              NavigateUtils.navigateToAndRemove(context, MainScreen())
            }
          : NavigateUtils.navigateToAndRemove(context, Login());
    });
  }

  void checkLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    isLoggedIn = pref.getBool("isUserLoggedIn")!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FadeIn(
            duration: Duration(seconds: 5),
            child: Image.asset(
              "assets/images/logo.png",
              width: 100,
            )),
      ),
    );
  }
}
