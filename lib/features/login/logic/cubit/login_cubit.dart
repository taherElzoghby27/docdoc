import 'package:bloc/bloc.dart';
import 'package:doc_doc/core/helpers/constants.dart';
import 'package:doc_doc/core/helpers/shared_pref.dart';
import 'package:doc_doc/core/networking/dio_factory.dart';
import 'package:doc_doc/features/login/data/models/login_request_body.dart';
import 'package:doc_doc/features/login/data/repos/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());
  //variables
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //login method
  Future<void> login() async {
    emit(const LoginState.loading());
    final result = await loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.when(
      success: (loginResponse) async {
        await saveToken(loginResponse.userData.token);
        DioFactory.setTokenToHeaders(loginResponse.userData.token);
        emit(LoginState.success(loginResponse));
      },
      failure: (errorModel) {
        emit(
          LoginState.error(errorModel.apiErrorModel.message ?? ''),
        );
      },
    );
  }

  saveToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  }
}
