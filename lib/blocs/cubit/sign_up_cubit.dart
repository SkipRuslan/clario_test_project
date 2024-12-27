import 'package:bloc/bloc.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp() async {
    emit(SignUpLoading());
    await Future.delayed(const Duration(seconds: 3));
    emit(SignUpSuccess());
  }
}
