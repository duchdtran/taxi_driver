// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import '../screens/sign_in/index.dart' as _i3;
import '../screens/sign_up/bank_card/index.dart' as _i7;
import '../screens/sign_up/documents/index.dart' as _i8;
import '../screens/sign_up/index.dart' as _i4;
import '../screens/sign_up/otp/index.dart' as _i5;
import '../screens/sign_up/personal/index.dart' as _i6;
import '../screens/sign_up/thanks/index.dart' as _i9;
import '../screens/welcome/index.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    WelcomeScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i2.WelcomeScreen());
    },
    SignInScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i3.SignInScreen());
    },
    SignUpScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i4.SignUpScreen());
    },
    SignUpOTPScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i5.SignUpOTPScreen());
    },
    SignUpPersonalScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i6.SignUpPersonalScreen());
    },
    SignUpBankCardScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i7.SignUpBankCardScreen());
    },
    SignUpDocumentsScreen.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i8.SignUpDocumentsScreen());
    },
    SignUpThanksScreen.name: (entry) {
      return _i1.MaterialPageX(entry: entry, child: _i9.SignUpThanksScreen());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(WelcomeScreen.name, path: '/'),
        _i1.RouteConfig(SignInScreen.name, path: '/sign_in'),
        _i1.RouteConfig(SignUpScreen.name, path: '/sign_up'),
        _i1.RouteConfig(SignUpOTPScreen.name, path: '/sign_up/otp'),
        _i1.RouteConfig(SignUpPersonalScreen.name, path: '/sign_up/personal'),
        _i1.RouteConfig(SignUpBankCardScreen.name, path: '/sign_up/bank_card'),
        _i1.RouteConfig(SignUpDocumentsScreen.name, path: '/sign_up/documents'),
        _i1.RouteConfig(SignUpThanksScreen.name, path: '/sign_up/thanks')
      ];
}

class WelcomeScreen extends _i1.PageRouteInfo {
  const WelcomeScreen() : super(name, path: '/');

  static const String name = 'WelcomeScreen';
}

class SignInScreen extends _i1.PageRouteInfo {
  const SignInScreen() : super(name, path: '/sign_in');

  static const String name = 'SignInScreen';
}

class SignUpScreen extends _i1.PageRouteInfo {
  const SignUpScreen() : super(name, path: '/sign_up');

  static const String name = 'SignUpScreen';
}

class SignUpOTPScreen extends _i1.PageRouteInfo {
  const SignUpOTPScreen() : super(name, path: '/sign_up/otp');

  static const String name = 'SignUpOTPScreen';
}

class SignUpPersonalScreen extends _i1.PageRouteInfo {
  const SignUpPersonalScreen() : super(name, path: '/sign_up/personal');

  static const String name = 'SignUpPersonalScreen';
}

class SignUpBankCardScreen extends _i1.PageRouteInfo {
  const SignUpBankCardScreen() : super(name, path: '/sign_up/bank_card');

  static const String name = 'SignUpBankCardScreen';
}

class SignUpDocumentsScreen extends _i1.PageRouteInfo {
  const SignUpDocumentsScreen() : super(name, path: '/sign_up/documents');

  static const String name = 'SignUpDocumentsScreen';
}

class SignUpThanksScreen extends _i1.PageRouteInfo {
  const SignUpThanksScreen() : super(name, path: '/sign_up/thanks');

  static const String name = 'SignUpThanksScreen';
}
