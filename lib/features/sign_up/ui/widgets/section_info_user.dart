import 'package:doc_doc/core/helpers/app_regex.dart';
import 'package:doc_doc/core/helpers/const_strings.dart';
import 'package:doc_doc/core/helpers/spacing.dart';
import 'package:doc_doc/core/widgets/custom_text_field.dart';
import 'package:doc_doc/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sign_up_bloc_listener.dart';
import 'validate_password.dart';

class SectionInfoUser extends StatefulWidget {
  const SectionInfoUser({super.key});

  @override
  State<SectionInfoUser> createState() => _SectionEmailAndPasswordState();
}

class _SectionEmailAndPasswordState extends State<SectionInfoUser> {
  bool isObscureTextPass1 = true;
  bool isObscureTextPass2 = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordEditingController1;
  late TextEditingController passwordEditingController2;
  @override
  void initState() {
    passwordEditingController1 = context.read<SignUpCubit>().passwordController;
    passwordEditingController2 =
        context.read<SignUpCubit>().passwordConfirmationController;
    setupPasswordControllerListener();
    super.initState();
  }

  setupPasswordControllerListener() {
    passwordEditingController1.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(
          passwordEditingController1.text,
        );
        hasUppercase = AppRegex.hasUpperCase(
          passwordEditingController1.text,
        );
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordEditingController1.text,
        );
        hasNumber = AppRegex.hasNumber(
          passwordEditingController1.text,
        );
        hasMinLength = AppRegex.hasMinLength(
          passwordEditingController1.text,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          verticalSpace(25.h),
          AppTextFormField(
            hintText: Strings.name,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return Strings.pleaseEnterName;
              }
              return null;
            },
            controller: context.read<SignUpCubit>().nameController,
          ),
          verticalSpace(12.h),
          AppTextFormField(
            hintText: Strings.phone,
            validator: (String? value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return Strings.pleaseEnterValidNum;
              }
              return null;
            },
            controller: context.read<SignUpCubit>().phoneController,
          ),
          verticalSpace(12.h),
          AppTextFormField(
            hintText: Strings.email,
            validator: (String? value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return Strings.pleaseEnterValidEmail;
              }
              return null;
            },
            controller: context.read<SignUpCubit>().emailController,
          ),
          verticalSpace(12.h),
          //password
          AppTextFormField(
            hintText: Strings.password,
            isObscureText: isObscureTextPass1,
            suffixIcon: IconButton(
              onPressed: () =>
                  setState(() => isObscureTextPass1 = !isObscureTextPass1),
              icon: Icon(
                isObscureTextPass1 ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return Strings.pleaseEnterValidPassword;
              }
              return null;
            },
            controller: passwordEditingController1,
          ),
          verticalSpace(12.h),
          //confirmation password
          AppTextFormField(
            hintText: Strings.confirmationPassword,
            isObscureText: isObscureTextPass2,
            suffixIcon: IconButton(
              onPressed: () =>
                  setState(() => isObscureTextPass2 = !isObscureTextPass2),
              icon: Icon(
                isObscureTextPass2 ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (String? value) {
              if (value == null ||
                  value.isEmpty ) {
                return Strings.pleaseEnterValidPassword;
              }
              if(value != passwordEditingController1.text){
                return Strings.passwordShouldBeSame;
              }
              return null;
            },
            controller: passwordEditingController2,
          ),
          verticalSpace(14.h),
          ValidatePassword(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
          verticalSpace(14.h),
          const SignUpBlocListener(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordEditingController1.dispose();
    passwordEditingController2.dispose();
    super.dispose();
  }
}
