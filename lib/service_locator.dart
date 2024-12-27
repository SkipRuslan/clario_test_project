import 'package:clario_test_project/blocs/cubit/sign_up_cubit.dart';
import 'package:clario_test_project/blocs/validation/email_validator_bloc.dart';
import 'package:clario_test_project/blocs/validation/password_validator_bloc.dart';
import 'package:clario_test_project/router/app_router.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  serviceLocator
    ..registerSingleton(AppRouter())
    ..registerFactory(() => EmailValidatorBloc())
    ..registerFactory(() => PasswordValidatorBloc())
    ..registerFactory(() => SignUpCubit());
}
