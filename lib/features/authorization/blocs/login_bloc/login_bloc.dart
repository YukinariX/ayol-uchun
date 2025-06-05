import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../data/repositories/authorization_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _repo;
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();



  LoginBloc({required AuthRepository repo})
      : _repo = repo,
        super(LoginState.initial()) {
    on<LoginLoad>(_loginLoad);
    on<SignUpLoad>(_signUpLoad);
  }

  Future<void> _loginLoad(LoginLoad event, Emitter<LoginState> emit) async {

    try {
      final store = await _repo.login(
        "+998${phoneNumberController.text.trim()}",
        passwordController.text.trim(),
      );

      if (store) {
        emit(state.copyWith(status: LoginStatus.idle));
      } else {
        emit(state.copyWith(status: LoginStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.error));
    }
  }
  Future<void> _signUpLoad(SignUpLoad event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading)); // optional: show loading state

    try {
      final success = await _repo.signUp(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (success) {
        emit(state.copyWith(status: LoginStatus.success)); // or idle
      } else {
        emit(state.copyWith(status: LoginStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.error));
    }
  }
}
