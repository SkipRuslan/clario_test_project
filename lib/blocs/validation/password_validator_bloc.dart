import 'package:clario_test_project/blocs/validation/validator_bloc.dart';
import 'package:clario_test_project/blocs/validation/validators.dart';

class PasswordValidatorBloc extends ValidationBloc<PasswordValidator> {
  @override
  PasswordValidator buildValidator(ValidationEvent event) {
    return PasswordValidator(event.value);
  }
}
