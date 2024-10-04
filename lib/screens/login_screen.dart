import 'package:dev_dot_academy/components/input_text.dart';
import 'package:dev_dot_academy/components/password_input.dart';
import 'package:dev_dot_academy/components/primary_button.dart';
import 'package:dev_dot_academy/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:50,),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset("assets/images/login.jpg",),
            ),
            Text("Login",style: TextStyle(fontSize:30,color:Colors.greenAccent),),
            SizedBox(height:10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20,vertical:10),
              child: InputText(prefixImage:Icon(Icons.email,color: Colors.greenAccent,), placeholder:"Email", controller:email ),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal:20,vertical:10),
              child: PasswordInput(prefixImage:Icon(Icons.lock,color: Colors.greenAccent,), placeholder:"Password", controller: password),
            ),
            SizedBox(height:10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20,vertical:5),
              child: PrimaryButton(text:"Login", onTap:(){
                Provider.of<AuthProvider>(context,listen: false).logInUser(email.text, password.text);
              }),
            )
          ],
        ),
      ),
    );
  }
}