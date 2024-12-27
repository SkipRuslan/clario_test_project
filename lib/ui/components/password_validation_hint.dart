import 'package:clario_test_project/UI/theme/app_colors.dart';
import 'package:clario_test_project/blocs/validation/validators.dart';
import 'package:clario_test_project/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PasswordValidationHint extends StatelessWidget {
  const PasswordValidationHint({
    super.key,
    required this.hint,
    required this.exceptions,
    required this.shouldEqualToException,
  });

  final String hint;
  final List<ValidatorException>? exceptions;
  final ValidatorException shouldEqualToException;

  TextStyle get _defaultHintStyle => AppTextStyles.passwordValidationHint.copyWith(color: AppColors.darkBlue);

  TextStyle _hintStyle() {
    if (exceptions == null) return _defaultHintStyle.copyWith(color: AppColors.darkBlue);

    return _defaultHintStyle.copyWith(color: _containProperException() ? AppColors.red : AppColors.green);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedDefaultTextStyle(
        style: _defaultHintStyle,
        duration: const Duration(milliseconds: 900),
        child: Text(hint, style: _hintStyle()),
      ),
    );
  }

  bool _containProperException() => exceptions?.contains(shouldEqualToException) ?? false;
}
