import 'package:auto_route/auto_route.dart';
import 'package:clario_test_project/blocs/cubit/sign_up_cubit.dart';
import 'package:clario_test_project/blocs/validation/email_validator_bloc.dart';
import 'package:clario_test_project/blocs/validation/password_validator_bloc.dart';
import 'package:clario_test_project/blocs/validation/validator_bloc.dart';
import 'package:clario_test_project/router/app_router.gr.dart';
import 'package:clario_test_project/service_locator.dart';
import 'package:clario_test_project/ui/components/custom_text_field.dart';
import 'package:clario_test_project/ui/components/starry_background.dart';
import 'package:clario_test_project/ui/pages/sign_up/widgets/password_hints.dart';
import 'package:clario_test_project/ui/pages/sign_up/widgets/sign_up_button.dart';
import 'package:clario_test_project/ui/theme/app_colors.dart';
import 'package:clario_test_project/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpCubit _signUpCubit;
  late TextEditingController _emailController;
  late EmailValidatorBloc _emailValidatorBloc;
  late TextEditingController _passwordController;
  late PasswordValidatorBloc _passwordValidatorBloc;

  @override
  void initState() {
    super.initState();
    _signUpCubit = serviceLocator<SignUpCubit>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailValidatorBloc = serviceLocator<EmailValidatorBloc>();
    _passwordValidatorBloc = serviceLocator<PasswordValidatorBloc>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _signUpCubit),
        BlocProvider.value(value: _emailValidatorBloc),
        BlocProvider.value(value: _passwordValidatorBloc),
      ],
      child: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) context.replaceRoute(const HomeRoute());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: StarryBackground(
            starColor: AppColors.lightBlue,
            backgroundGradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.backgroundGradient,
            ),
            child: Center(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Sign up", style: AppTextStyles.pageTitle),
                              const SizedBox(height: 40),
                              BlocBuilder<EmailValidatorBloc, ValidationState>(
                                buildWhen: (previous, current) => current.isLateValidation,
                                builder: (context, state) {
                                  return CustomTextField(
                                    helperText: 'Email',
                                    fieldType: FieldType.email,
                                    exceptions: state.exceptions,
                                    controller: _emailController,
                                    onInputChanged: (value) => _emailValidatorBloc.add(ValidationEvent(value: value)),
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              BlocBuilder<PasswordValidatorBloc, ValidationState>(
                                buildWhen: (previous, current) => current.isLateValidation,
                                builder: (context, state) {
                                  return CustomTextField(
                                    shouldSubmit: true,
                                    shouldShowExceptions: false,
                                    exceptions: state.exceptions,
                                    fieldType: FieldType.password,
                                    controller: _passwordController,
                                    helperText: 'Create your password',
                                    onInputChanged: (value) => _passwordValidatorBloc.add(
                                      ValidationEvent(value: value),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              BlocBuilder<PasswordValidatorBloc, ValidationState>(
                                buildWhen: (previous, current) => !current.isLateValidation,
                                builder: (context, state) {
                                  return PasswordHints(exceptions: state.exceptions);
                                },
                              ),
                              const SizedBox(height: 40),
                              BlocBuilder<SignUpCubit, SignUpState>(
                                buildWhen: (previous, current) => current is SignUpLoading || current is SignUpInitial,
                                builder: (context, state) {
                                  return SignUpButton(
                                    isLoading: state is SignUpLoading,
                                    onPressed: _onSignUpButtonPressed,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onSignUpButtonPressed() async {
    _emailValidatorBloc.add(
      ValidationEvent(
        isLateValidation: true,
        value: _emailController.value.text,
      ),
    );
    _passwordValidatorBloc.add(ValidationEvent(
      isLateValidation: true,
      value: _passwordController.value.text,
    ));

    if ((_emailValidatorBloc.state.exceptions?.isEmpty ?? false) &&
        (_passwordValidatorBloc.state.exceptions?.isEmpty ?? false)) {
      await _signUpCubit.signUp();
    }
  }
}
