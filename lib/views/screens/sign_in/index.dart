import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../resources/color.dart';
import '../../resources/style.dart';
import '../../routers/app_routers.dart';
import '../../widgets/app_button.dart';
import '../base/_index.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  FocusNode _phoneFocusNode;
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _phoneFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'WELCOME',
      children: [
        const SizedBox(height: 200),
        _buildTitle(context),
        const SizedBox(height: 36),
        _buildPhoneNumberFormField(context),
        const SizedBox(height: 40),
        _buildPasswordFormField(context),
        const SizedBox(height: 30),
        _buildForgotPasswordButton(context),
        const SizedBox(height: 30),
        _buildLoginButton(context),
        const SizedBox(height: 35),
        _buildCreateAccountButton(context, onPressed: () {
          Navigator.pushNamed(context, AppRouters.signUpScreen);
        }),
      ],
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
      keyboardType: TextInputType.phone,
      focusNode: _phoneFocusNode,
      decoration: InputDecoration(
        labelText: 'Phone number',
        labelStyle: AppStyles.stylePoppinsRegular12.copyWith(
          color: AppColors.colorGrey,
        ),
        prefix: CountryCodePicker(
          onChanged: print,
          textStyle: AppStyles.stylePoppinsRegular14,
          searchStyle: AppStyles.stylePoppinsRegular14,
          dialogTextStyle: AppStyles.stylePoppinsRegular14,
          padding: EdgeInsets.zero,
        ),
      ),
      onFieldSubmitted: (phoneNumber) {
        _passwordFocusNode.requestFocus();
      },
    );
  }

  Widget _buildPasswordFormField(BuildContext context) {
    return TextFormField(
      focusNode: _passwordFocusNode,
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

  Widget _buildCreateAccountButton(BuildContext context,
      {VoidCallback onPressed}) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        'Or Create My Account',
        style: AppStyles.stylePoppinsLight14,
      ),
    );
  }
}
