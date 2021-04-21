import 'package:flutter/material.dart';
import '../resources/color.dart';
import '../resources/style.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  AppButton({
    @required this.label,
    @required this.onPressed,
    Key key,
    this.textStyle = AppStyles.stylePoppinsBold14,
    this.backgroundColor = AppColors.colorApple,
  }) : super(key: key);

  AppButton.outline({
    @required this.label,
    @required this.onPressed,
    Key key,
    this.side = const BorderSide(color: AppColors.colorApple),
    TextStyle textStyle,
  }) : super(key: key) {
    this.textStyle = textStyle ??
        AppStyles.stylePoppinsBold14.copyWith(color: AppColors.colorApple);
  }

  AppButton.round({
    @required this.label,
    @required this.onPressed,
    Key key,
    this.backgroundColor = AppColors.colorApple,
    this.textStyle = AppStyles.stylePoppinsBold14,
    BorderRadius borderRadius,
  }) : super(key: key) {
    this.borderRadius = borderRadius ?? BorderRadius.circular(100);
  }

  AppButton.icon({
    @required this.label,
    @required this.onPressed,
    Key key,
    this.backgroundColor = AppColors.colorApple,
    this.textStyle = AppStyles.stylePoppinsBold14,
    this.padding = const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
    BorderRadius borderRadius,
    Icon icon,
  }) : super(key: key) {
    this.borderRadius = borderRadius ?? BorderRadius.circular(6);
    this.icon = icon ??
        const Icon(
          Icons.arrow_forward,
          color: AppColors.colorWhite,
        );
  }

  AppButton.elevated({
    @required this.label,
    @required this.onPressed,
    Key key,
    this.backgroundColor = AppColors.colorWhite,
    this.padding = const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
    this.elevation = 2,
    TextStyle textStyle,
    BorderRadius borderRadius,
    Icon icon,
  }) : super(key: key) {
    this.borderRadius = borderRadius ?? BorderRadius.circular(6);
    this.icon = icon ??
        const Icon(
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
    final child = icon != null
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
      child: child,
    );
  }
}
