import 'package:flutter/material.dart';
import 'package:taxi_driver/views/resources/color.dart';
import 'package:taxi_driver/views/resources/dimension.dart';
import 'package:taxi_driver/views/resources/style.dart';
import 'package:taxi_driver/views/screens/base/_index.dart';
import 'package:taxi_driver/views/widgets/app_button.dart';
import 'package:taxi_driver/views/widgets/app_sized_box.dart';

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
      horizontal: AppDimension.screen_horizontal_margin,
    ),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSizedBox.height(200),
          _buildTitle(context),
          AppSizedBox.height(36),
          _buildPhoneNumberFormField(context),
          AppSizedBox.height(40),
          _buildPasswordFormField(context),
          AppSizedBox.height(30),
          _buildForgotPasswordButton(context),
          AppSizedBox.height(30),
          _buildLoginButton(context),
          AppSizedBox.height(35),
          _buildCreateAccountButton(context),
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

Widget _buildCreateAccountButton(BuildContext context) {
  return TextButton(
      onPressed: () {},
      child: Text(
        'Or Create My Account',
        style: AppStyles.stylePoppinsLight14,
      ));
}
