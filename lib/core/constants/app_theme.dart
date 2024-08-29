import 'package:flutter/material.dart';
import 'package:savingsbox_test/core/constants/app_color.dart';

import '../../gen/fonts.gen.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get lightTheme => ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      primarySwatch: Colors.blue,
      fontFamily: FontFamily.sora,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: WidgetStateProperty.all(true),
        trackVisibility: WidgetStateProperty.all(true),
        trackColor: WidgetStateProperty.all(AppColor.grey100),
        thumbColor: WidgetStateProperty.all(AppColor.grey300),
        thickness: WidgetStateProperty.all(4),
        radius: const Radius.circular(15),
      ));

  static ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      primarySwatch: Colors.blue,
      fontFamily: FontFamily.sora,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: WidgetStateProperty.all(true),
        trackVisibility: WidgetStateProperty.all(true),
        trackColor: WidgetStateProperty.all(AppColor.grey100),
        thumbColor: WidgetStateProperty.all(AppColor.grey300),
        thickness: WidgetStateProperty.all(4),
        radius: const Radius.circular(15),
      ));
}
