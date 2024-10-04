import 'package:flutter/material.dart';

class VideoLock extends StatefulWidget {
  const VideoLock({super.key});

  @override
  State<VideoLock> createState() => _VideoLockState();
}

class _VideoLockState extends State<VideoLock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      height:200,
      decoration: BoxDecoration(color: Color.fromARGB(58, 185, 185, 185)),
      child:Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.lock),
          Text("Buy This Course To View")
        ],),
      ),
    );
  }
}