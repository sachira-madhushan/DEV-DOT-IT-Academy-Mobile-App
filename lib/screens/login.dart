import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset("assets/images/login.jpg",),
          ),
          Text("Login",style: TextStyle(fontSize:30,color:Colors.greenAccent),)
        ],
      ),
    );
  }
}