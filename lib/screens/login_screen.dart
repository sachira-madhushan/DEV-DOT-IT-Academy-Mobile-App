import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dev_dot_academy/components/input_text.dart';
import 'package:dev_dot_academy/components/password_input.dart';
import 'package:dev_dot_academy/components/primary_button.dart';
import 'package:dev_dot_academy/providers/auth_provider.dart';
import 'package:dev_dot_academy/screens/main_screen.dart';
import 'package:dev_dot_academy/utils/navigate_utils.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isLoading = Provider.of<AuthProvider>(context).isLoading;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                "assets/images/login.jpg",
              ),
            ),
            Text(
              "Login",
              style: TextStyle(fontSize: 30, color: Colors.greenAccent),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: InputText(
                  prefixImage: Icon(
                    Icons.email,
                    color: Colors.greenAccent,
                  ),
                  placeholder: "Email",
                  controller: email),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: PasswordInput(
                  prefixImage: Icon(
                    Icons.lock,
                    color: Colors.greenAccent,
                  ),
                  placeholder: "Password",
                  controller: password),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: isLoading
                  ? LoadingAnimationWidget.staggeredDotsWave(
                      color: const Color.fromARGB(255, 138, 219, 141),
                      size: 50,
                    )
                  : PrimaryButton(
                      text: "Login",
                      onTap: () {
                        Provider.of<AuthProvider>(context, listen: false)
                            .logInUser(email.text, password.text)
                            .then((value) => {
                              print(value),
                                  if (!value)
                                    {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        animType: AnimType.scale,
                                        title: 'Invalid Email Or Password',
                                        desc:
                                            'Please check your email and password',
                                        btnCancelOnPress: () {},
                                        btnOkOnPress: () {},
                                      )..show()
                                    }else{
                                      NavigateUtils.navigateToAndRemove(context,MainScreen())
                                    }
                                });
                      }),
            )
          ],
        ),
      ),
    );
  }
}
