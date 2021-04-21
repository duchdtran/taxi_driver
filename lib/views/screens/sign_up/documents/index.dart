import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../resources/style.dart';
import '../../../routers/app_routers.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_stepper_widget.dart';
import '../../base/_index.dart';

class SignUpDocumentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(children: [
      const SizedBox(height: 37),
      _buildDocumentList(context),
      const SizedBox(height: 50),
      _buildTermAndPrivacy(context),
      const SizedBox(height: 50),
      _buildCreateAccountButton(
        context,
        onPressed: () {
          Navigator.pushNamed(context, AppRouters.signUpThanksScreen);
        },
      ),
      const SizedBox(height: 37),
    ]);
  }

  Widget _buildDocumentList(BuildContext context) {
    return AppStepperWidget();
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

  Widget _buildCreateAccountButton(BuildContext context,
      {VoidCallback onPressed}) {
    return AppButton.icon(
      label: 'Create Account',
      onPressed: onPressed,
    );
  }
}
