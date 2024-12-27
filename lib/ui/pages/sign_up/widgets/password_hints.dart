import 'package:clario_test_project/blocs/validation/validators.dart';
import 'package:clario_test_project/ui/components/password_validation_hint.dart';
import 'package:flutter/material.dart';

class PasswordHints extends StatelessWidget {
  const PasswordHints({super.key, required this.exceptions});

  final List<ValidatorException>? exceptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          PasswordValidationHint(
            exceptions: exceptions,
            hint: '8 characters or more(no spaces)',
            shouldEqualToException: ValidatorException.eightCharactersOrMore,
          ),
          const SizedBox(height: 4),
          PasswordValidationHint(
            exceptions: exceptions,
            hint: 'Upper case and lowercase letter',
            shouldEqualToException: ValidatorException.upperAndLowerCase,
          ),
          const SizedBox(height: 4),
          PasswordValidationHint(
            hint: 'At least one digit',
            exceptions: exceptions,
            shouldEqualToException: ValidatorException.atLeastOneDigit,
          ),
        ],
      ),
    );
  }
}
