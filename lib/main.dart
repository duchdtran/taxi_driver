import 'package:flutter/material.dart';

import 'views/routers/AppRouters.dart';
import 'views/screens/sign_in/index.dart';
import 'views/screens/sign_up/index.dart';
import 'views/screens/welcome/index.dart';

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
        AppRouters.SIGN_UP_SCREEN: (context) => SignUpScreen(),
      },
    );
  }
}
