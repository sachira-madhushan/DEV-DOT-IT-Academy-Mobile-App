import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class PasswordInput extends StatefulWidget {
  PasswordInput({super.key,required this.prefixImage,required this.placeholder,required this.controller});
  
  final Icon prefixImage;
  final String placeholder;
  final TextEditingController controller;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isHidden=true;

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
            child: widget.prefixImage),
          Positioned(
            left:71,
            top:2,
            width:340,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: TextField(
                controller: widget.controller,
                obscureText: isHidden,
                style: TextStyle(fontSize: 18),
                decoration:InputDecoration(
                  border:UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: widget.placeholder,
                
                ),
              ),
            ),
          ),
          Positioned(
            right:22,
            top:5,
            child:isHidden?IconButton(onPressed:(){
              setState(() {
                isHidden=false;
              });
            }, icon: Icon(Icons.visibility_off)):
            IconButton(onPressed:(){
                setState(() {
                isHidden=true;
              });
            }, icon: Icon(Icons.visibility))
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