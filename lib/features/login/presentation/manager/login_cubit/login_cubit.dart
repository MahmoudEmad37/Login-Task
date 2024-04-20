import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:login_task/features/login/data/models/user_model.dart';
import 'package:login_task/features/login/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  final LoginRepo loginRepo;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> loginUser() async {
    isLoading = true;
    emit(LoginLoading());

    var result = await loginRepo.login(
        user: UserModel(
            email: emailController.text.trim(),
            password: passwordController.text.trim()));

    result.fold((failure) {
      isLoading = false;
      emit(LoginFailure(failure.message));
    }, (data) {
      isLoading = false;
      emit(LoginSuccess(data));
    });
  }

  void loginValiate() {
    if (formKey.currentState!.validate()) {
      loginUser();
    }
  }
}
