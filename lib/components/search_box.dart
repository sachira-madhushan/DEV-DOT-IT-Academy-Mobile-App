import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class SearchBox extends StatefulWidget {
  SearchBox({super.key,required this.prefixImage,required this.placeholder,required this.controller});
  
  final Icon prefixImage;
  final String placeholder;
  final TextEditingController controller;

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  bool isHidden=true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 364,
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
                style: TextStyle(fontSize: 18),
                decoration:InputDecoration(
                  border:UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: widget.placeholder,
                
                ),
              ),
            ),
          ),
          
        ],
      ),
      decoration:BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(color: Color.fromARGB(33, 101, 101, 101),blurRadius:8),
        ],
        borderRadius:BorderRadius.circular(20),
      ),
    );
  }
}