import 'package:flutter/material.dart';
import 'package:taxi_driver/views/resources/color.dart';
import 'package:taxi_driver/views/resources/images.dart';
import 'package:taxi_driver/views/resources/style.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({Key key, this.title, this.body}) : super(key: key);
  String title;
  Widget body;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.BG),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.colorTransparent,
        appBar: AppBar(
          title: Text(
            title,
            style: AppStyles.stylePoppinsBold14
                .copyWith(color: AppColors.colorWhite),
          ),
          elevation: 0,
          backgroundColor: AppColors.colorTransparent,
        ),
        body: body,
      ),
    );
  }
}
