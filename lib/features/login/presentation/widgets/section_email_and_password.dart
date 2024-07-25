import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/const_strings.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../logic/cubit/login_cubit.dart';
import 'login_bloc_listener.dart';
import 'validate_password.dart';

class SectionEmailAndPassword extends StatefulWidget {
  const SectionEmailAndPassword({super.key});

  @override
  State<SectionEmailAndPassword> createState() =>
      _SectionEmailAndPasswordState();
}

class _SectionEmailAndPasswordState extends State<SectionEmailAndPassword> {
  bool isObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordEditingController;
  @override
  void initState() {
    passwordEditingController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
    super.initState();
  }

  setupPasswordControllerListener() {
    passwordEditingController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(
          passwordEditingController.text,
        );
        hasUppercase = AppRegex.hasUpperCase(
          passwordEditingController.text,
        );
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordEditingController.text,
        );
        hasNumber = AppRegex.hasNumber(
          passwordEditingController.text,
        );
        hasMinLength = AppRegex.hasMinLength(
          passwordEditingController.text,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          verticalSpace(25.h),
          //login
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
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(12.h),
          //password
          AppTextFormField(
            hintText: Strings.password,
            isObscureText: isObscureText,
            suffixIcon: IconButton(
              onPressed: () => setState(() => isObscureText = !isObscureText),
              icon: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return Strings.pleaseEnterValidPassword;
              }
              return null;
            },
            controller: passwordEditingController,
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
          const LoginBlocListener(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordEditingController.dispose();
    super.dispose();
  }
}
