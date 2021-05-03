import 'package:flutter/material.dart';
import '../../../../translations/generated/l10n.dart';
import '../../../resources/color.dart';
import '../../../resources/dimension.dart';
import '../../../resources/images.dart';
import '../../../resources/style.dart';
import '../../../widgets/app_button.dart';

class SignUpThanksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimension.screenHorizontalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 74),
          _buildTitle(context),
          const SizedBox(height: 19),
          _buildTermsAndConditions(context),
          const SizedBox(height: 50),
          Expanded(child: _buildBackground(context)),
          const SizedBox(height: 75),
          _buildGoToProfileButton(context),
          const SizedBox(height: 96),
        ],
      ),
    ));
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      S.of(context).sign_up_thanks_thank_you,
      style: AppStyles.stylePoppinsBold24,
    );
  }

  Widget _buildTermsAndConditions(BuildContext context) {
    return Text(
      '${S.of(context).sign_up_thank_you_for_registering_with_company} \n${S.of(context).sign_up_thanks_please_complete_your_registration}',
      style: AppStyles.stylePoppinsRegular14.copyWith(
        color: AppColors.colorMatterhorn,
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Image.asset(
      AppImages.bgWelcome,
      fit: BoxFit.fitHeight,
    );
  }

  Widget _buildGoToProfileButton(BuildContext context,
      {VoidCallback onPressed}) {
    return AppButton.icon(
      label: S.of(context).sign_up_thanks_go_to_profile,
      onPressed: onPressed,
    );
  }
}
