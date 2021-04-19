import 'package:flutter/material.dart';

import '../../resources/color.dart';
import '../../resources/dimension.dart';
import '../../resources/style.dart';
import '../../routers/AppRouters.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_sized_box.dart';
import '../base/_index.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'WELCOME',
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: AppDimension.screenHorizontalMargin,
    ),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSizedBox.height(200),
          _buildTitle(context),
          const AppSizedBox.height(36),
          _buildPhoneNumberFormField(context),
          const AppSizedBox.height(40),
          _buildPasswordFormField(context),
          const AppSizedBox.height(30),
          _buildForgotPasswordButton(context),
          const AppSizedBox.height(30),
          _buildLoginButton(context),
          const AppSizedBox.height(35),
          _buildCreateAccountButton(context, onPressed: (){
            Navigator.pushNamed(context, AppRouters.SIGN_UP_SCREEN);
          }),
        ],
      ),
    ),
  );
}

Widget _buildTitle(BuildContext context) {
  return Text(
    'Welcome back!',
    style: AppStyles.stylePoppinsBold24.copyWith(
      color: AppColors.colorNightRider,
    ),
  );
}

Widget _buildPhoneNumberFormField(BuildContext context) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Phone number',
      labelStyle: AppStyles.stylePoppinsRegular12.copyWith(
        color: AppColors.colorGrey,
      ),
    ),
  );
}

Widget _buildPasswordFormField(BuildContext context) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Password',
      labelStyle: AppStyles.stylePoppinsRegular12.copyWith(
        color: AppColors.colorGrey,
      ),
    ),
  );
}

Widget _buildForgotPasswordButton(BuildContext context) {
  return TextButton(
    onPressed: () {},
    child: Text(
      'Forgot password?',
      style: AppStyles.stylePoppinsRegular12.copyWith(
        color: AppColors.colorNightRider,
      ),
    ),
  );
}

Widget _buildLoginButton(BuildContext context) {
  return AppButton.icon(label: 'Login', onPressed: () {});
}

Widget _buildCreateAccountButton(BuildContext context, {VoidCallback onPressed}) {
  return TextButton(
      onPressed: onPressed,
      child: const Text(
        'Or Create My Account',
        style: AppStyles.stylePoppinsLight14,
      ));
}
