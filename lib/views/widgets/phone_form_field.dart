import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../resources/images.dart';
import '../resources/style.dart';
import 'app_divider.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({Key key, this.onFieldSubmitted}) : super(key: key);

  final Function(String) onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CountryCodePicker(
          onChanged: print,
          textStyle: AppStyles.stylePoppinsRegular14,
          searchStyle: AppStyles.stylePoppinsRegular14,
          dialogTextStyle: AppStyles.stylePoppinsRegular14,
          padding: EdgeInsets.zero,
        ),
        Image.asset(AppImages.icArrawDown),
        const SizedBox(width: 10),
        const AppVerticalDivider(),
        const SizedBox(width: 24),
        Flexible(
          child: TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: 'Enter your phone number',
              hintStyle: AppStyles.stylePoppinsRegular14,
              border: InputBorder.none,
            ),
            onFieldSubmitted: onFieldSubmitted,
          ),
        ),
      ],
    );
  }
}
