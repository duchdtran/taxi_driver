import 'package:flutter/material.dart';

import '../../../translations/generated/l10n.dart';
import '../../resources/color.dart';
import '../../resources/dimension.dart';
import '../../resources/images.dart';
import '../../resources/style.dart';
import '../../widgets/my_context.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    @required this.children,
    Key key,
    this.title,
  })  : assert(children != null),
        super(key: key);
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
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: context.bgColor,
          appBar: AppBar(
            title: Text(
              title ?? S.of(context).back,
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
      ),
    );
  }
}
