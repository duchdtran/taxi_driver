import 'package:flutter/material.dart';
import '../../resources/color.dart';
import '../../resources/images.dart';
import '../../resources/style.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key key, this.title, this.body}) : super(key: key);
  final String title;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.bg),
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
