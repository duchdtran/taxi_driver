import 'package:flutter/material.dart';
import 'package:taxi_driver/views/routers/AppRouters.dart';
import 'package:taxi_driver/views/screens/sign_in/index.dart';
import 'package:taxi_driver/views/screens/welcome/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        AppRouters.WELCOME_SCREEN: (context) => WelcomeScreen(),
        AppRouters.SIGN_IN_SCREEN: (context) => SignInScreen(),
      },
    );
  }
}
