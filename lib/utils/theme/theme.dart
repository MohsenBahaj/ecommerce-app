import 'package:ecomm/utils/constants/colors.dart';
import 'package:ecomm/utils/theme/custom/appbar_theme.dart';
import 'package:ecomm/utils/theme/custom/bottom_sheet.theme.dart';
import 'package:ecomm/utils/theme/custom/checkbox_theme.dart';
import 'package:ecomm/utils/theme/custom/chip_theme.dart';
import 'package:ecomm/utils/theme/custom/elevated_button_theme.dart';
import 'package:ecomm/utils/theme/custom/outlined_button_theme.dart';
import 'package:ecomm/utils/theme/custom/text_field_theme.dart';
import 'package:ecomm/utils/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextThemeClass.lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeClass.lightElevatedButtonTheme,
    chipTheme: ChipThemeClass.lightChipTheme,
    appBarTheme: AppBarThemeClass.lightAppBarTheme,
    checkboxTheme: CheckBoxThemeClass.lightCheckBoxTheme,
    bottomSheetTheme: BottomSheetThemeClass.lightBottomSheetTheme,
    outlinedButtonTheme: OutlinedButtonThemeClass.lightOutlinedButtonTheme,
    inputDecorationTheme: TextFieldThemeClass.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TextThemeClass.darkTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeClass.darkElevatedButtonTheme,
    chipTheme: ChipThemeClass.darkChipTheme,
    appBarTheme: AppBarThemeClass.darkAppBarTheme,
    checkboxTheme: CheckBoxThemeClass.darkCheckBoxTheme,
    bottomSheetTheme: BottomSheetThemeClass.darkBottomSheetTheme,
    outlinedButtonTheme: OutlinedButtonThemeClass.darkoutlinedButtonTheme,
    inputDecorationTheme: TextFieldThemeClass.darkInputDecorationTheme,
  );
}
