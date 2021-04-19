import 'package:flutter/material.dart';

import '../resources/color.dart';
import '../resources/style.dart';

class AppFloatingActionButtonGo extends StatelessWidget {
  const AppFloatingActionButtonGo({
    @required this.onPressed,
    Key key,
    this.width = 40,
    this.height = 40,
    this.backgroundColor = AppColors.colorApple,
    this.labelStyle = AppStyles.stylePoppinsBold14,
    this.label = 'GO',
  }) : super(key: key);

  final double width;
  final double height;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final String label;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          child: Text(
            label,
            style: labelStyle,
          ),
        ),
      ),
    );
  }
}

class AppFloatingActionButtonArrowForward extends StatelessWidget {
  const AppFloatingActionButtonArrowForward({
    @required this.onPressed,
    Key key,
    this.width,
    this.height,
    this.backgroundColor,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  const AppFloatingActionButtonArrowForward.active(
      {@required this.onPressed,
      Key key,
      this.width = 50,
      this.height = 50,
      this.backgroundColor = AppColors.colorApple,
      this.icon = Icons.arrow_forward,
      this.iconColor = AppColors.colorWhite})
      : super(key: key);

  const AppFloatingActionButtonArrowForward.inactive({
    @required this.onPressed,
    Key key,
    this.width = 50,
    this.height = 50,
    this.backgroundColor = AppColors.colorWhite,
    this.icon = Icons.arrow_forward,
    this.iconColor = AppColors.colorSilver,
  }) : super(key: key);

  final double width;
  final double height;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
