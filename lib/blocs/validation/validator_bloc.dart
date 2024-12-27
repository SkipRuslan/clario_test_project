import 'package:bloc/bloc.dart';
import 'package:clario_test_project/blocs/validation/validators.dart';
import 'package:equatable/equatable.dart';

abstract class ValidationBloc<VALIDATOR extends Validator> extends Bloc<ValidationEvent, ValidationState> {
  ValidationBloc() : super(ValidationState.def()) {
    on<ValidationEvent>((event, emit) {
      List<ValidatorException> exceptions = [];

      exceptions = buildValidator(event).haveExceptions();

      emit(ValidationState(exceptions: exceptions, isLateValidation: event.isLateValidation, value: event.value));
    });
  }

  VALIDATOR buildValidator(ValidationEvent event);
}

class ValidationState extends Equatable {
  const ValidationState({required this.exceptions, this.isLateValidation = false, required this.value});

  factory ValidationState.def() => const ValidationState(exceptions: null, isLateValidation: false, value: '');

  final String value;
  final bool isLateValidation;
  final List<ValidatorException>? exceptions;

  @override
  List<Object?> get props => [exceptions, isLateValidation];
}

class ValidationEvent extends Equatable {
  const ValidationEvent({required this.value, this.isLateValidation = false});

  final String value;
  final bool isLateValidation;

  @override
  List<Object?> get props => [value, isLateValidation, value];
}
