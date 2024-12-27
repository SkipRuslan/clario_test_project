import 'package:clario_test_project/blocs/validation/validator_bloc.dart';
import 'package:clario_test_project/blocs/validation/validators.dart';

class EmailValidatorBloc extends ValidationBloc<EmailValidator> {
  @override
  EmailValidator buildValidator(ValidationEvent event) {
    return EmailValidator(event.value);
  }
}
