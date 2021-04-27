import 'package:auto_route/auto_route.dart';

import '../screens/sign_in/index.dart';
import '../screens/sign_up/bank_card/index.dart';
import '../screens/sign_up/documents/index.dart';
import '../screens/sign_up/index.dart';
import '../screens/sign_up/otp/index.dart';
import '../screens/sign_up/personal/index.dart';
import '../screens/sign_up/thanks/index.dart';
import '../screens/welcome/index.dart';

// Use the [watch] flag to watch the files' system for edits and rebuild as necessary.

// flutter packages pub run build_runner watch
// if you want the generator to run one time and exits use

// flutter packages pub run build_runner build

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: WelcomeScreen,initial: true, path: '/'),
    AutoRoute(page: SignInScreen, path: '/sign_in'),
    AutoRoute(page: SignUpScreen, path: '/sign_up'),
    AutoRoute(page: SignUpOTPScreen, path: '/sign_up/otp'),
    AutoRoute(page: SignUpPersonalScreen, path: '/sign_up/personal'),
    AutoRoute(page: SignUpBankCardScreen, path: '/sign_up/bank_card'),
    AutoRoute(page: SignUpDocumentsScreen, path: '/sign_up/documents'),
    AutoRoute(page: SignUpThanksScreen, path: '/sign_up/thanks'),
  ],
)
class $AppRouter {}
