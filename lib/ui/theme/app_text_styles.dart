import 'package:clario_test_project/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle get defaultTextStyle => const TextStyle(
        fontSize: 16,
        fontFamily: 'Inter',
        color: AppColors.darkBlue,
        fontWeight: FontWeight.w400,
      );

  static TextStyle pageTitle = defaultTextStyle.copyWith(
    fontSize: 28,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textFieldHint = defaultTextStyle.copyWith(
    color: AppColors.lightBlue,
    fontWeight: FontWeight.w400,
  );

  static TextStyle passwordValidationHint = defaultTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static TextStyle button = defaultTextStyle.copyWith(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  );

  static TextStyle inputTextStyle = defaultTextStyle.copyWith(
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w400,
  );
}
