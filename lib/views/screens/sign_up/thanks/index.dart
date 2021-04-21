import 'package:flutter/material.dart';
import 'package:taxi_driver/views/resources/color.dart';
import 'package:taxi_driver/views/resources/dimension.dart';
import 'package:taxi_driver/views/resources/images.dart';
import 'package:taxi_driver/views/resources/style.dart';
import 'package:taxi_driver/views/widgets/app_button.dart';
import '../../base/_index.dart';

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
    return const Text(
      'Thank you!',
      style: AppStyles.stylePoppinsBold24,
    );
  }

  Widget _buildTermsAndConditions(BuildContext context) {
    return Text(
      'Thank you for registering with Company. \nPlease complete your registration and be activated by visiting our office.',
      style: AppStyles.stylePoppinsRegular14.copyWith(color: AppColors.colorMatterhorn),
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
    return AppButton.icon(label: 'Go to Profile', onPressed: onPressed);
  }
}
