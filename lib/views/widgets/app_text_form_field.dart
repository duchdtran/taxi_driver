import 'package:flutter/material.dart';

import '../resources/color.dart';
import '../resources/images.dart';
import '../resources/style.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key key,
    this.labelText,
    this.obscureText = false,
    this.showPassword = false,
    this.focusNode,
    this.onFieldSubmitted,
  }) : super(key: key);

  final String labelText;
  final bool obscureText;
  final bool showPassword;
  final FocusNode focusNode;
  final Function(String) onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: labelText ?? '',
        labelStyle: AppStyles.stylePoppinsRegular12
            .copyWith(color: AppColors.colorGrey),
        suffixIcon: showPassword ? Image.asset(AppImages.icView) : null,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 0,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorHawkesBlue2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.colorApple, width: 2),
        ),
      ),
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
