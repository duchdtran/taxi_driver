import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../resources/color.dart';
import '../../resources/dimension.dart';
import '../../resources/style.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_sized_box.dart';
import '../base/_index.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'BACK',
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimension.screenHorizontalMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle(context),
          const AppSizedBox.height(30),
          _buildPhoneNumberFormField(context),
          const AppSizedBox.height(45),
          _buildTermAndPrivacy(context),
          const AppSizedBox.height(45),
          _buildContinueButton(context),
        ],
      ),
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
      padding: const EdgeInsets.all(11),
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
      child: InternationalPhoneNumberInput(
        onInputChanged: (number) {
          log(number.phoneNumber);
        },
        onInputValidated: (value) {
          log(value.toString());
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        hintText: 'Enter your phone number',
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: const TextStyle(color: Colors.black),
        formatInput: false,
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: true),
        onSaved: (number) {
          log('On Saved: $number');
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

  Widget _buildContinueButton(BuildContext context) {
    return AppButton.elevated(label: 'Continue', onPressed: () {});
  }
}
