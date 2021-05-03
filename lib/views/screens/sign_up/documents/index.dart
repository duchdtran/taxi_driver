import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../translations/generated/l10n.dart';
import '../../../resources/style.dart';
import '../../../routers/app_routers.gr.dart';
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
          const SignUpThanksScreen().show(context);
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
          TextSpan(
            text: '${S.of(context).sign_up_documents_by_continue_i_comfirm}\n',
            style: AppStyles.stylePoppinsRegular12,
          ),
          TextSpan(
            text: S.of(context).sign_up_documents_term_of_service,
            style: AppStyles.stylePoppinsBold12,
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(text: ' ${S.of(context).sign_up_documents_and} ', style: AppStyles.stylePoppinsRegular12),
          TextSpan(
            text: S.of(context).sign_up_documents_privacy_policy,
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
      label: S.of(context).sign_up_documents_create_account,
      onPressed: onPressed,
    );
  }
}
