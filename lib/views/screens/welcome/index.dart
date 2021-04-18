import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_driver/views/resources/color.dart';
import 'package:taxi_driver/views/resources/dimension.dart';
import 'package:taxi_driver/views/resources/style.dart';
import 'package:taxi_driver/views/routers/AppRouters.dart';
import 'package:taxi_driver/views/screens/welcome/components/show_case_page_view.dart';
import 'package:taxi_driver/views/widgets/app_button.dart';
import 'package:taxi_driver/views/widgets/app_sized_box.dart';

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
        AppSizedBox.height(50),
        _buildTitle(
          context,
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension.screen_horizontal_margin),
        ),
        AppSizedBox.height(60),
        Expanded(child: _buildShowCasePageView(context)),
        AppSizedBox.height(50),
        _buildLoginButton(
          context,
          onPressed: () {
            Navigator.pushNamed(context, AppRouters.SIGN_IN_SCREEN);
          },
          padding: EdgeInsets.symmetric(
            horizontal: AppDimension.screen_horizontal_margin,
          ),
        ),
        AppSizedBox.height(35),
        _buildCreateAccountButton(
          context,
          onPressed: () {},
          padding: EdgeInsets.symmetric(
            horizontal: AppDimension.screen_horizontal_margin,
          ),
        ),
        AppSizedBox.height(48),
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
