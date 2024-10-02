import 'dart:ffi';
import 'package:dev_dot_academy/utils/color_utils.dart';
import 'package:dev_dot_academy/utils/font_utils.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key,required this.text,required this.onTap});
  final String text;
  final Function() onTap;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:60,
        width:double.infinity,
        child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontFamily: FontUtils.primary),)),
        decoration:BoxDecoration(
          color: ColorUtils.primary,
          
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Color.fromARGB(75, 101, 101, 101),blurRadius:10),
          ]
        ),
      ),
    );
  }
}