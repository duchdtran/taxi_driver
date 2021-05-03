import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import '../../../../translations/generated/l10n.dart';
import '../../../resources/color.dart';
import '../../../resources/style.dart';
import '../../../routers/app_routers.gr.dart';
import '../../../widgets/app_floating_action_button.dart';
import '../../base/_index.dart';
import 'components/pin_view.dart';

class SignUpOTPScreen extends StatefulWidget {
  @override
  _SignUpOTPScreenState createState() => _SignUpOTPScreenState();
}

class _SignUpOTPScreenState extends State<SignUpOTPScreen> {
  bool _isShowContinue;
  FocusNode _otpFocusNode;

  @override
  void initState() {
    super.initState();

    _isShowContinue = false;
    _otpFocusNode = FocusNode()..requestFocus();
  }

  @override
  void dispose() {
    _otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
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
              const SignUpPersonalScreen().show(context);
            }),
          ],
        )
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: '${S.of(context).sign_up_otp_phone_verilication}\n',
            style: AppStyles.stylePoppinsRegular12),
        TextSpan(
          text: S.of(context).sign_up_otp_enter_your_otp_code,
          style: AppStyles.stylePoppinsBold24,
        )
      ]),
    );
  }

  Widget _buildGuild(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text:
              '${S.of(context).sign_up_otp_enter_the_4_digit_code_sent_to_you_at('+994 10 990 00 00')}\n',
          style: AppStyles.stylePoppinsRegular14,
        ),
        TextSpan(
          text: S.of(context).sign_up_otp_did_you_enter_the_correct_number,
          style: AppStyles.stylePoppinsBold14
              .copyWith(color: AppColors.colorApple),
        )
      ]),
    );
  }

  Widget _buildPinView(BuildContext context) {
    return PinView(
      focusNode: _otpFocusNode,
      onComplete: (otp) {
        setState(() {
          _isShowContinue = true;
        });
      },
    );
  }

  Widget _buildResendCode(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan> [
          TextSpan(
            text: S.of(context).sign_up_otp_resend_code_in,
            style: AppStyles.stylePoppinsRegular12,
          ),
          TextSpan(
            text: S.of(context).sign_up_otp_number_second('10'),
            style: AppStyles.stylePoppinsBold12
                .copyWith(color: AppColors.colorApple),
          ),
        ],
      ),
    );
  }

  Widget _buildNextStepButton(BuildContext context, {VoidCallback onPressed}) {
    return Conditional.single(
      context: context,
      conditionBuilder: (_) => _isShowContinue,
      widgetBuilder: (_) => AppFloatingActionButtonArrowForward.active(
        onPressed: onPressed,
      ),
      fallbackBuilder: (_) =>
          const AppFloatingActionButtonArrowForward.inactive(),
    );
  }
}
