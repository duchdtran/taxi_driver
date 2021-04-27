import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../resources/color.dart';
import '../../../../resources/style.dart';

class PinView extends StatelessWidget {
  const PinView({
    Key key,
    this.cursorColor,
    this.length,
    this.borderRadius,
    this.width,
    this.height,
    this.onComplete, this.focusNode,
  }) : super(key: key);

  final Color cursorColor;
  final int length;
  final BorderRadius borderRadius;
  final double width;
  final double height;
  final Function(String) onComplete;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      focusNode: focusNode,
      appContext: context,
      length: 4,
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        activeFillColor: Colors.white,
        activeColor: Colors.white,
        selectedColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        inactiveColor: Colors.white,
        fieldHeight: 53,
        fieldWidth: 76,
      ),
      textStyle: AppStyles.stylePoppinsBold18,
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      boxShadows: [
        BoxShadow(
          offset: const Offset(0, 5),
          color: AppColors.colorNightRider.withOpacity(0.05),
          blurRadius: 15,
        )
      ],
      onCompleted: onComplete,
      onChanged: (value) {},
    );
  }
}
