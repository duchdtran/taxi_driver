import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../../resources/color.dart';
import '../../resources/style.dart';
import '../../routers/app_routers.gr.dart';
import '../../widgets/app_button.dart';
import '../../widgets/phone_form_field.dart';
import '../base/_index.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isShowContinue;

  @override
  void initState() {
    _isShowContinue = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      children: [
        const SizedBox(height: 224),
        _buildTitle(context),
        const SizedBox(height: 30),
        _buildPhoneNumberFormField(context),
        const SizedBox(height: 45),
        _buildTermAndPrivacy(context),
        const SizedBox(height: 45),
        _buildContinueButton(context, onPress: () {
          const SignUpOTPScreen().show(context);
        }),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return RichText(
        text: const TextSpan(children: [
      TextSpan(
        text: 'Hello, nice to meet you!\n',
        style: AppStyles.stylePoppinsRegular12,
      ),
      TextSpan(
        text: 'Join our Company!',
        style: AppStyles.stylePoppinsBold24,
      ),
    ]));
  }

  Widget _buildPhoneNumberFormField(BuildContext context) {
    return Container(
      height: 65,
      // padding: const EdgeInsets.all/(11),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorNightRider.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: PhoneFormField(
        onFieldSubmitted: (phoneNumber) {
          setState(() {
            _isShowContinue = true;
          });
        },
      ),
    );
  }

  Widget _buildTermAndPrivacy(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
            text: 'By creating an account, you agree to our\n',
            style: AppStyles.stylePoppinsRegular12),
        TextSpan(
          text: 'Terms of Service',
          style: AppStyles.stylePoppinsBold12,
          recognizer: TapGestureRecognizer()..onTap = () {},
        ),
        const TextSpan(text: ' and ', style: AppStyles.stylePoppinsRegular12),
        TextSpan(
          text: 'Privacy Policy',
          style: AppStyles.stylePoppinsBold12,
          recognizer: TapGestureRecognizer()..onTap = () {},
        ),
      ]),
    );
  }

  Widget _buildContinueButton(BuildContext context, {VoidCallback onPress}) {
    return Conditional.single(
      context: context,
      conditionBuilder: (_) => _isShowContinue,
      widgetBuilder: (_) => AppButton.icon(
        label: 'Continue',
        onPressed: onPress,
      ),
      fallbackBuilder: (_) => AppButton.elevated(
        label: 'Continue',
      ),
    );
  }
}
