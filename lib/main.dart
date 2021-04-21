import 'package:flutter/material.dart';

import 'views/routers/app_routers.dart';
import 'views/screens/sign_in/index.dart';
import 'views/screens/sign_up/bank_card/index.dart';
import 'views/screens/sign_up/documents/index.dart';
import 'views/screens/sign_up/index.dart';
import 'views/screens/sign_up/otp/index.dart';
import 'views/screens/sign_up/personal/index.dart';
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
        AppRouters.welcomeScreen: (context) => WelcomeScreen(),
        AppRouters.signInScreen: (context) => SignInScreen(),
        AppRouters.signUpScreen: (context) => SignUpScreen(),
        AppRouters.signUpOTPScreen: (context) => SignUpOTPScreen(),
        AppRouters.signUpPersonalScreen: (context) => SignUpPersonalScreen(),
        AppRouters.signUpBankCardScreen: (context) => SignUpBankCardScreen(),
        AppRouters.signUpDocumentsScreen: (context) => SignUpDocumentsScreen(),
      },
    );
  }
}