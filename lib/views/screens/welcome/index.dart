import 'package:flutter/material.dart';

import '../../../translations/generated/l10n.dart';
import '../../../ultils/keys.dart';
import '../../resources/color.dart';
import '../../resources/dimension.dart';
import '../../resources/style.dart';
import '../../routers/app_routers.gr.dart';
import '../../widgets/app_button.dart';
import 'components/show_case_page_view.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey(Keys.welcomeScreenKey),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        _buildTitle(
          context,
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimension.screenHorizontalMargin),
        ),
        const SizedBox(height: 60),
        Expanded(child: _buildShowCasePageView(context)),
        const SizedBox(height: 50),
        _buildLoginButton(
          context,
          onPressed: () {
            const SignInScreen().show(context);
          },
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimension.screenHorizontalMargin,
          ),
        ),
        const SizedBox(height: 35),
        _buildCreateAccountButton(
          context,
          onPressed: () {
            const SignUpScreen().show(context);
          },
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimension.screenHorizontalMargin,
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }

  Widget _buildTitle(BuildContext context, {EdgeInsets padding}) {
    return Padding(
      padding: padding,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '${S.of(context).welcome_nice_to_meet_you}\n',
              style: AppStyles.stylePoppinsRegular14,
            ),
            TextSpan(
              text: S.of(context).welcome_get_a_new_exprience,
              style: AppStyles.stylePoppinsBold24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShowCasePageView(BuildContext context) {
    return ShowCasePageView();
  }

  Widget _buildLoginButton(BuildContext context,
      {VoidCallback onPressed, EdgeInsets padding}) {
    return Padding(
      padding: padding,
      child: AppButton.icon(
          key: const ValueKey(Keys.welcomeLoginButtonKey),
          label: S.of(context).welcome_login_with_phone,
          onPressed: onPressed),
    );
  }

  Widget _buildCreateAccountButton(BuildContext context,
      {VoidCallback onPressed, EdgeInsets padding}) {
    return Padding(
      padding: padding,
      child: TextButton(
        key: const ValueKey(Keys.welcomeSignUpButtonKey),
        onPressed: onPressed,
        child: Text(
          S.of(context).welcome_or_create_my_account,
          style: AppStyles.stylePoppinsLight14
              .copyWith(color: AppColors.colorMatterhorn),
        ),
      ),
    );
  }
}
