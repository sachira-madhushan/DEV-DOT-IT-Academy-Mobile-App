import 'package:flutter/material.dart';

class NavigateUtils{
  static void navigateToAndRemove(BuildContext context,Widget route ){
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>route), (route) => false);
  }

  static void navigateTo(BuildContext context,Widget route){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>route));
  }
}