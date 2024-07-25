import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/sign_up_request_body.dart';
import '../../data/repos/sign_up_repo.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo signUpRepo;
  SignUpCubit(this.signUpRepo) : super(const SignUpState.initial());
  //variables
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  //SignUp method
  Future<void> signUp() async {
    emit(const SignUpState.loading());
    final result = await signUpRepo.signUp(
      SignUpRequestBody(
        email: emailController.text,
        password: passwordController.text,
        confirmationPassword: passwordConfirmationController.text,
        name: nameController.text,
        phone: phoneController.text,
        gender: '0',
      ),
    );
    result.when(
      success: (signUpResponse) {
        emit(SignUpState.success(signUpResponse));
      },
      failure: (errorModel) {
        emit(
          SignUpState.error(errorModel.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
