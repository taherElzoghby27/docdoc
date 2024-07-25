import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/const_strings.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../logic/cubit/login_cubit.dart';
import 'section_already_have_an_acount.dart';
import 'section_email_and_password.dart';
import 'section_terms_and_conditions.dart';
import 'top_section_login.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(15.h),
            //welcome back
            const TopSectionLogin(),
            const SectionEmailAndPassword(),
            //forget password button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  Strings.forgetPass,
                  style: TextStyles.font12BlueRegular,
                ),
              ),
            ),
            verticalSpace(18.h),
            //login
            AppTextButton(
              buttonText: Strings.login,
              textStyle: TextStyles.font16WhiteSemiBold,
              onPressed: () async {
                if (context
                    .read<LoginCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  await context.read<LoginCubit>().login();
                }
              },
            ),
            verticalSpace(30.h),
            const SectionTermsAndConditions(),
            verticalSpace(12.h),
            const SectionAlreadyHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
