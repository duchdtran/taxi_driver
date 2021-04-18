import 'package:flutter/material.dart';
import 'package:taxi_driver/views/resources/color.dart';
import 'package:taxi_driver/views/resources/images.dart';
import 'package:taxi_driver/views/widgets/app_sized_box.dart';

class ShowCasePageView extends StatelessWidget {
  int indexPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Image.asset(AppImages.BG_WELCOME),
          ),
        ),
        AppSizedBox.height(50),
        Center(
          child: Wrap(
            spacing: 10,
            children: List.generate(
              3,
              (index) => Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: indexPosition == index
                        ? AppColors.colorApple
                        : AppColors.colorSilver),
              ),
            ),
          ),
        )
      ],
    );
  }
}
