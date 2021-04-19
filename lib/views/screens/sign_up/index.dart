import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:taxi_driver/views/resources/color.dart';
import 'package:taxi_driver/views/resources/dimension.dart';
import 'package:taxi_driver/views/resources/style.dart';
import 'package:taxi_driver/views/screens/base/_index.dart';
import 'package:taxi_driver/views/widgets/app_button.dart';
import 'package:taxi_driver/views/widgets/app_sized_box.dart';

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
        horizontal: AppDimension.screen_horizontal_margin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle(context),
          AppSizedBox.height(30),
          _buildPhoneNumberFormField(context),
          AppSizedBox.height(45),
          _buildTermAndPrivacy(context),
          AppSizedBox.height(45),
          _buildContineButton(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
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
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorNightRider.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) {
          print(number.phoneNumber);
        },
        onInputValidated: (bool value) {
          print(value);
        },
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        hintText: 'Enter your phone number',
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: TextStyle(color: Colors.black),
        formatInput: false,
        keyboardType:
            TextInputType.numberWithOptions(signed: true, decimal: true),
        onSaved: (PhoneNumber number) {
          print('On Saved: $number');
        },
      ),
    );
  }

  Widget _buildTermAndPrivacy(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: 'By creating an account, you agree to our\n',
            style: AppStyles.stylePoppinsRegular12),
        TextSpan(
          text: 'Terms of Service',
          style: AppStyles.stylePoppinsBold12,
          recognizer: TapGestureRecognizer()..onTap = () {},
        ),
        TextSpan(text: ' and ', style: AppStyles.stylePoppinsRegular12),
        TextSpan(
          text: 'Privacy Policy',
          style: AppStyles.stylePoppinsBold12,
          recognizer: TapGestureRecognizer()..onTap = () {},
        ),
      ]),
    );
  }

  Widget _buildContineButton(BuildContext context) {
    return AppButton.elevated(label: 'Continue', onPressed: () {});
  }
}
