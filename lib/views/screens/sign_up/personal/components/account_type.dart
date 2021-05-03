import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../../resources/color.dart';
import '../../../../resources/style.dart';
import '../../../../widgets/custom_toggle_buttons.dart';

class AccountType extends StatefulWidget {
  const AccountType({this.children});
  final List<Widget> children;
  @override
  _AccountTypeState createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  List<bool> _isSelected;

  @override
  void initState() {
    _isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomToggleButtons(
          isSelected: _isSelected,
          onPressed: (index) {
            setState(() {
              if (!_isSelected[index]) {
                for (var buttonIndex = 0;
                    buttonIndex < _isSelected.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    _isSelected[buttonIndex] = !_isSelected[buttonIndex];
                    log(buttonIndex.toString());
                  } else {
                    _isSelected[buttonIndex] = false;
                  }
                }
              }
            });
          },
          constraints: BoxConstraints.expand(width: constraints.maxWidth / 2 -11, height: 42),
          spacing: 10,
          borderWidth: 3,
          textStyle: AppStyles.stylePoppinsBold14,
          selectedColor: AppColors.colorWhite,
          color: AppColors.colorApple,
          fillColor: AppColors.colorApple,
          borderColor: AppColors.colorApple,
          selectedBorderColor: AppColors.colorApple,
          children: widget.children,
        );
      },
    );
  }
}
