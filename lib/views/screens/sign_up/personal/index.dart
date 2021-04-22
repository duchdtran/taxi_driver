import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../../../resources/color.dart';
import '../../../resources/images.dart';
import '../../../routers/app_routers.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_form_field.dart';
import '../../base/_index.dart';
import 'components/account_type.dart';

class SignUpPersonalScreen extends StatefulWidget {
  @override
  _SignUpPersonalScreenState createState() => _SignUpPersonalScreenState();
}

class _SignUpPersonalScreenState extends State<SignUpPersonalScreen> {
  bool _isShowContinue;
  FocusNode _firstNameFocusNode;
  FocusNode _lastNameFocusNode;
  FocusNode _homeAddressFocusNode;
  FocusNode _passwordFocusNode;

  String _firstName;
  String _lastName;
  String _homeAddress;
  String _password;

  @override
  void initState() {
    super.initState();

    _isShowContinue = false;
    _firstNameFocusNode = FocusNode();
    _lastNameFocusNode = FocusNode();
    _homeAddressFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _homeAddressFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _checkShowContinue() {
    if (_firstName == null || _firstName.isEmpty) {
      return;
    }
    if (_lastName == null || _lastName.isEmpty) {
      return;
    }
    if (_homeAddress == null || _homeAddress.isEmpty) {
      return;
    }
    if (_password == null || _password.isEmpty) {
      return;
    }
    setState(() {
      _isShowContinue = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
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
        _buildCreateAccountButton(context, onPressed: () {
          Navigator.pushNamed(context, AppRouters.signUpBankCardScreen);
        }),
        const SizedBox(height: 62),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 144,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: AppColors.colorWhite,
            child: Image.asset(
              AppImages.icAvatarNone,
              width: 144,
              height: 144,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Image.asset(
              AppImages.icCamera,
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
    return const AccountType(
      labels: ['Free', 'Buess'],
    );
  }

  Widget _buildFirstNameFormField(BuildContext context) {
    return AppTextFormField(
      labelText: 'First name',
      focusNode: _firstNameFocusNode,
      onFieldSubmitted: (firstName) {
        _lastNameFocusNode.requestFocus();
        _firstName = firstName;

        _checkShowContinue();
      },
    );
  }

  Widget _buildLastNameFormField(BuildContext context) {
    return AppTextFormField(
      labelText: 'Last name',
      focusNode: _lastNameFocusNode,
      onFieldSubmitted: (lastName) {
        _homeAddressFocusNode.requestFocus();
        _lastName = lastName;

        _checkShowContinue();
      },
    );
  }

  Widget _buildHomeAddressFormField(BuildContext context) {
    return AppTextFormField(
      labelText: 'Home address',
      focusNode: _homeAddressFocusNode,
      onFieldSubmitted: (homeAddress) {
        _passwordFocusNode.requestFocus();
        _homeAddress = homeAddress;

        _checkShowContinue();
      },
    );
  }

  Widget _buildPasswordFormField(BuildContext context) {
    return AppTextFormField(
      labelText: 'Password',
      showPassword: true,
      obscureText: true,
      focusNode: _passwordFocusNode,
      onFieldSubmitted: (password) {
        _password = password;

        _checkShowContinue();
      },
    );
  }

  Widget _buildCreateAccountButton(BuildContext context,
      {VoidCallback onPressed}) {
    return Conditional.single(
      context: context,
      conditionBuilder: (_) => _isShowContinue,
      widgetBuilder: (_) => AppButton.icon(
        label: 'Create Account',
        onPressed: onPressed,
      ),
      fallbackBuilder: (_) => AppButton.elevated(
        label: 'Create Account',
      ),
    );
  }
}
