import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../../../translations/generated/l10n.dart';
import '../../resources/color.dart';
import '../../resources/style.dart';
import '../../routers/app_routers.gr.dart';
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
      title: S.of(context).welcome.toUpperCase(),
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
          const SignUpScreen().show(context);
        }),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      S.of(context).sign_in_welcome_back,
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
        labelText: S.of(context).sign_in_phone_number,
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
        labelText: S.of(context).sign_in_password,
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
        S.of(context).sign_in_fotgot_password,
        style: AppStyles.stylePoppinsRegular12.copyWith(
          color: AppColors.colorNightRider,
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return AppButton.icon(label: S.of(context).login, onPressed: () {});
  }

  Widget _buildCreateAccountButton(BuildContext context,
      {VoidCallback onPressed}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        S.of(context).sign_in_or_create_my_account,
        style: AppStyles.stylePoppinsLight14,
      ),
    );
  }
}
