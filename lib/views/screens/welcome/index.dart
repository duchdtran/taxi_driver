import 'package:flutter/material.dart';

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
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Hello, nice to meet you!\n',
              style: AppStyles.stylePoppinsRegular14,
            ),
            TextSpan(
              text: 'Get a new experience',
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
      child: AppButton.icon(label: 'Login with Phone', onPressed: onPressed),
    );
  }

  Widget _buildCreateAccountButton(BuildContext context,
      {VoidCallback onPressed, EdgeInsets padding}) {
    return Padding(
      padding: padding,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Or Create My Account',
          style: AppStyles.stylePoppinsLight14
              .copyWith(color: AppColors.colorMatterhorn),
        ),
      ),
    );
  }
}
