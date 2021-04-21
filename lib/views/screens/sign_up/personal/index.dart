import 'package:flutter/material.dart';
import 'package:taxi_driver/views/resources/color.dart';

import '../../../resources/dimension.dart';
import '../../../resources/images.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_form_field.dart';
import '../../base/_index.dart';
import 'components/account_type.dart';

class SignUpPersonalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'BACK',
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimension.screenHorizontalMargin,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 37),
            _buildAvatar(context),
            const SizedBox(height: 50),
            _buildTypeAccount(context),
            const SizedBox(height: 43),
            _buildFirstNameFormField(context),
            const SizedBox(height: 25),
            _buildLastNameFormField(context),
            const SizedBox(height: 25),
            _buildHomeAddressFormField(context),
            const SizedBox(height: 25),
            _buildPasswordFormField(context),
            const SizedBox(height: 45),
            _buildCreateAccountButton(context),
            const SizedBox(height: 62),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return Container(
      width: 144,
      height: 144,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: AppColors.colorWhite,
            child: Image.asset(
              AppImages.avatarNone,
              width: 144,
              height: 144,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Image.asset(
              AppImages.camera,
              width: 40,
              height: 33,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeAccount(BuildContext context) {
    return AccountType(
      labels: ['Free', 'Buess'],
    );
  }

  Widget _buildFirstNameFormField(BuildContext context) {
    return const AppTextFormField(
      labelText: 'First name',
    );
  }

  Widget _buildLastNameFormField(BuildContext context) {
    return const AppTextFormField(
      labelText: 'Last name',
    );
  }

  Widget _buildHomeAddressFormField(BuildContext context) {
    return const AppTextFormField(
      labelText: 'Home address',
    );
  }

  Widget _buildPasswordFormField(BuildContext context) {
    return const AppTextFormField(
      labelText: 'Password',
      showPassword: true,
      obscureText: true,
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    return AppButton.icon(label: 'Create Account', onPressed: () {});
  }
}