import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../resources/color.dart';
import '../../../resources/images.dart';
import '../../../resources/style.dart';
import '../../../routers/app_routers.gr.dart';
import '../../../widgets/app_floating_action_button.dart';
import '../../../widgets/credit_card_widget.dart';
import '../../base/_index.dart';

class SignUpBankCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      children: [
        const SizedBox(height: 37),
        _buildBankCard(context),
        const SizedBox(height: 51),
        _buildTermAndPrivacy(context),
        const SizedBox(height: 35),
        Row(
          children: [
            _buildScanCreditCard(context),
            const Spacer(),
            _buildNextStepButton(context, onPressed: () {
              const SignUpDocumentsScreen().show(context);
            }),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildBankCard(BuildContext context) {
    return SizedBox(width: double.infinity, child: CreditCardWidget());
  }

  Widget _buildTermAndPrivacy(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'By continuing, I confirm that i have read & agree to the\n',
            style: AppStyles.stylePoppinsRegular12,
          ),
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
        ],
      ),
    );
  }

  Widget _buildScanCreditCard(BuildContext context) {
    return TextButton.icon(
      label: Text(
        'Scan Credit Card',
        style: AppStyles.stylePoppinsRegular11.copyWith(
          color: AppColors.colorGrey,
        ),
      ),
      icon: Image.asset(
        AppImages.icCamera,
        width: 22,
        height: 18,
      ),
      onPressed: () {},
    );
  }

  Widget _buildNextStepButton(BuildContext context, {VoidCallback onPressed}) {
    return AppFloatingActionButtonArrowForward.active(
      onPressed: onPressed,
    );
  }
}
