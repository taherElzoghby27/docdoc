import 'package:doc_doc/core/helpers/const_strings.dart';
import 'package:doc_doc/core/helpers/spacing.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/core/widgets/custom_button.dart';
import 'package:doc_doc/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../login/presentation/widgets/section_terms_and_conditions.dart';
import 'section_dont_have_acount.dart';
import 'section_info_user.dart';
import 'top_section_sign_up.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(15.h),
            //create account
            const TopSectionSignUp(),
            const SectionInfoUser(),
            verticalSpace(18.h),
            //sign up
            AppTextButton(
              buttonText: Strings.signUp,
              textStyle: TextStyles.font16WhiteSemiBold,
              onPressed: () async {
                if (context
                    .read<SignUpCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  await context.read<SignUpCubit>().signUp();
                }
              },
            ),
            verticalSpace(30.h),
            const SectionTermsAndConditions(),
            verticalSpace(12.h),
            const SectionDontHaveAccount(),
          ],
        ),
      ),
    );
  }
}
