import 'package:flutter/material.dart';
import '../resources/color.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    Key key,
    this.height = 1,
    this.color = AppColors.colorWhiteSmoke,
  }) : super(key: key);

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      color: color,
    );
  }
}

class AppVerticalDivider extends StatelessWidget {
  const AppVerticalDivider({
    Key key,
    this.width = 1,
    this.color = AppColors.colorWhiteSmoke,
  }) : super(key: key);

  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: double.infinity,
      color: color,
    );
  }
}
