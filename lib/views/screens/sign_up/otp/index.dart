import 'package:flutter/material.dart';

import '../../../resources/color.dart';
import '../../../resources/style.dart';
import '../../../routers/app_routers.dart';
import '../../../widgets/app_floating_action_button.dart';
import '../../base/_index.dart';
import 'components/pin_view.dart';

class SignUpOTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'BACK',
      children: [
        const SizedBox(height: 148),
        _buildTitle(context),
        const SizedBox(height: 8),
        _buildGuild(context),
        const SizedBox(height: 40),
        _buildPinView(context),
        const SizedBox(height: 46),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildResendCode(context),
            _buildNextStepButton(context, onPressed: () {
              Navigator.pushNamed(context, AppRouters.signUpPersonalScreen);
            }),
          ],
        )
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return RichText(
      text: const TextSpan(children: [
        TextSpan(
            text: 'Phone Verification\n',
            style: AppStyles.stylePoppinsRegular12),
        TextSpan(
          text: 'Enter your OTP code',
          style: AppStyles.stylePoppinsBold24,
        )
      ]),
    );
  }

  Widget _buildGuild(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        const TextSpan(
          text: 'Enter the 4-digit code sent to you at\n',
          style: AppStyles.stylePoppinsRegular14,
        ),
        const TextSpan(
          text: '+994 10 999 00 00. ',
          style: AppStyles.stylePoppinsRegular14,
        ),
        TextSpan(
          text: 'did you enter the correct number?',
          style: AppStyles.stylePoppinsBold14
              .copyWith(color: AppColors.colorApple),
        )
      ]),
    );
  }

  Widget _buildPinView(BuildContext context) {
    return PinView();
  }

  Widget _buildResendCode(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Resend Code in ',
            style: AppStyles.stylePoppinsRegular12,
          ),
          TextSpan(
            text: '10 seconds',
            style: AppStyles.stylePoppinsBold12
                .copyWith(color: AppColors.colorApple),
          ),
        ],
      ),
    );
  }

  Widget _buildNextStepButton(BuildContext context, {VoidCallback onPressed}) {
    return AppFloatingActionButtonArrowForward.active(
      onPressed: onPressed,
    );
  }
}
