import 'package:flutter/material.dart';

import '../../resources/color.dart';
import '../../resources/dimension.dart';
import '../../resources/images.dart';
import '../../resources/style.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key key, this.title, this.children}) : super(key: key);
  final String title;
  final List<Widget> children;
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
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimension.screenHorizontalMargin),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
