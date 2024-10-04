import 'package:dev_dot_academy/providers/auth_provider.dart';
import 'package:dev_dot_academy/screens/login_screen.dart';
import 'package:dev_dot_academy/screens/main_screen.dart';
import 'package:dev_dot_academy/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:  (_)=>AuthProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  void initState()async {
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev Dot Academy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
