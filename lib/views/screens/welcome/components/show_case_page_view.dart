import 'package:flutter/material.dart';
import '../../../resources/color.dart';
import '../../../resources/images.dart';

class ShowCasePageView extends StatelessWidget {
  final int indexPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Image.asset(AppImages.bgWelcome),
          ),
        ),
        const SizedBox(height: 50),
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
