import 'package:flutter/cupertino.dart';
import 'package:taxi_driver/views/resources/color.dart';
import 'package:taxi_driver/views/resources/font_config.dart';

class AppStyles {
  static const stylePoppinsBold24 = TextStyle(
    fontFamily: FontConfig.fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    height: 1.46,
    color: AppColors.colorNightRider,
  );
  static const stylePoppinsBold18 = TextStyle(
    fontFamily: FontConfig.fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: AppColors.colorGrey,
  );
  static const stylePoppinsRegular16 = TextStyle(
    fontFamily: FontConfig.fontFamily,
    fontSize: 16,
    height: 1.3,
    color: AppColors.colorBunker,
  );
  static const stylePoppinsBold14 = TextStyle(
    fontFamily: FontConfig.fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 2.5,
    color: AppColors.colorWhite,
  );
  static const stylePoppinsRegular14 = TextStyle(
    fontFamily: FontConfig.fontFamily,
    fontSize: 14,
    height: 2.5,
    color: AppColors.colorNightRider,
  );
  static const stylePoppinsLight14 = TextStyle(
    fontFamily: FontConfig.fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 14,
    color: AppColors.colorMatterhorn,
  );
}
