abstract interface class Validator {
  List<ValidatorException> haveExceptions();
}

class EmailValidator extends Validator {
  EmailValidator(this.email);

  final String email;

  @override
  List<ValidatorException> haveExceptions() {
    final List<ValidatorException> exceptions = [];

    if (email.trim() == '') {
      exceptions.add(ValidatorException.invalidEmail);
      return exceptions;
    }

    final RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!regExp.hasMatch(email)) {
      exceptions.add(ValidatorException.invalidEmail);
      return exceptions;
    }

    return exceptions;
  }
}

class PasswordValidator extends Validator {
  PasswordValidator(this.password);

  final String password;

  @override
  List<ValidatorException> haveExceptions() {
    final List<ValidatorException> exceptions = [];

    if (password.length < 8) {
      exceptions.add(ValidatorException.eightCharactersOrMore);
    }

    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])').hasMatch(password)) {
      exceptions.add(ValidatorException.upperAndLowerCase);
    }

    if (!RegExp(r'^(?=.*\d)').hasMatch(password)) {
      exceptions.add(ValidatorException.atLeastOneDigit);
    }

    return exceptions;
  }
}

enum ValidatorException { eightCharactersOrMore, upperAndLowerCase, atLeastOneDigit, invalidEmail }
