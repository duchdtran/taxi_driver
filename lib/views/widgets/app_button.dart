import 'package:flutter/material.dart';
import 'package:taxi_driver/views/resources/color.dart';
import 'package:taxi_driver/views/resources/style.dart';

class AppButton extends StatelessWidget {
  AppButton({
    Key key,
    @required this.label,
    @required this.onPressed,
    this.textStyle = AppStyles.stylePoppinsBold14,
    this.backgroundColor = AppColors.colorApple,
  }) : super(key: key);

  AppButton.outline({
    Key key,
    @required this.label,
    @required this.onPressed,
    this.side = const BorderSide(color: AppColors.colorApple),
    TextStyle textStyle,
  }) : super(key: key) {
    this.textStyle = textStyle ??
        AppStyles.stylePoppinsBold14.copyWith(color: AppColors.colorApple);
  }

  AppButton.round({
    Key key,
    @required this.label,
    @required this.onPressed,
    this.backgroundColor = AppColors.colorApple,
    this.textStyle = AppStyles.stylePoppinsBold14,
    BorderRadius borderRadius,
  }) : super(key: key) {
    this.borderRadius = borderRadius ?? BorderRadius.circular(100);
  }

  AppButton.icon({
    Key key,
    @required this.label,
    @required this.onPressed,
    this.backgroundColor = AppColors.colorApple,
    this.textStyle = AppStyles.stylePoppinsBold14,
    this.padding = const EdgeInsets.symmetric(horizontal: 40),
    BorderRadius borderRadius,
    Icon icon,
  }) : super(key: key) {
    this.borderRadius = borderRadius ?? BorderRadius.circular(6);
    this.icon = icon ??
        Icon(
          Icons.arrow_forward,
          color: AppColors.colorWhite,
        );
  }

  AppButton.elevated({
    Key key,
    @required this.label,
    @required this.onPressed,
    this.backgroundColor = AppColors.colorWhite,
    this.padding = const EdgeInsets.symmetric(horizontal: 40),
    this.elevation = 2,
    TextStyle textStyle,
    BorderRadius borderRadius,
    Icon icon,
  }) : super(key: key) {
    this.borderRadius = borderRadius ?? BorderRadius.circular(6);
    this.icon = icon ??
        Icon(
          Icons.arrow_forward,
          color: AppColors.colorSilver,
        );
    this.textStyle = textStyle ??
        AppStyles.stylePoppinsBold14.copyWith(color: AppColors.colorSilver);
  }

  Color backgroundColor;
  String label;
  TextStyle textStyle;
  Widget icon;
  BorderRadius borderRadius;
  BorderSide side;
  VoidCallback onPressed;
  EdgeInsets padding;
  double elevation;

  @override
  Widget build(BuildContext context) {
    Widget child = icon != null
        ? Padding(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: textStyle,
                ),
                icon
              ],
            ),
          )
        : Text(
            label,
            style: textStyle,
          );
    return TextButton(
      child: child,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        side: side,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.zero,
          side: side ?? BorderSide.none,
        ),
        elevation: elevation,
      ),
      onPressed: onPressed,
    );
  }
}
