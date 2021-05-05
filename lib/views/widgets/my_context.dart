import 'package:flutter/material.dart';

extension MyContext on BuildContext {
  Color dynamicColor({int light, int dark}) {
    return (Theme.of(this).brightness == Brightness.light)
        ? Color(light)
        : Color(dark);
  }

  Color dynamicColour({Color light, Color dark}) {
    return (Theme.of(this).brightness == Brightness.light) ? light : dark;
  }

  Color get primaryColor => dynamicColor(light: 0xFF58BE3F, dark: 0xFF58BE3F);
  Color get bgColor => dynamicColor(light: 0xFFFFFFFF, dark: 0xFF000000);
  Color get hintTextColor => dynamicColor(light: 0xFF797979, dark: 0xB3FFFFFF);
  Color get labelColor => dynamicColor(light: 0xFF303030, dark: 0xFFFFFFFF);
  Color get titleColor => dynamicColor(light: 0xFF303030, dark: 0xFFFFFFFF);
  Color get subtitleColor => dynamicColor(light: 0xFF303030, dark: 0xFFFFFFFF);
}
