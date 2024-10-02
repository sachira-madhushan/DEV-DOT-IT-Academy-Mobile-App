import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputText extends StatelessWidget {
  const InputText({super.key,required this.prefixImage,required this.placeholder,required this.controller,this.keyBoardType=TextInputType.text});
  
  final Icon prefixImage;
  final String placeholder;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 374,
      height:60,
      child: Stack(
        children: [
          Positioned(
            left:22,
            top:18,
            child: prefixImage),
          Positioned(
            left:71,
            top:2,
            width:340,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: TextField(
                keyboardType: keyBoardType,
                controller: controller,
                style: TextStyle(fontSize: 18),
                decoration:InputDecoration(
                  
                  border:UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: placeholder,
                  
                ),
              ),
            ),
          ),
        ],
      ),
      decoration:BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(color: Color.fromARGB(75, 101, 101, 101),blurRadius:10),
        ]
      ),
    );
  }
}