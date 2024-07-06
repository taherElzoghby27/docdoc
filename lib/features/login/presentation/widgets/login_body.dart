import 'package:doc_doc/core/helpers/const_strings.dart';
import 'package:doc_doc/core/helpers/spacing.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/core/widgets/custom_button.dart';
import 'package:doc_doc/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'section_already_have_an_acount.dart';
import 'section_terms_and_conditions.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
      child: Column(
        children: [
          verticalSpace(15.h),
          //welcome back
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.welcomeBack,
                style: TextStyles.font24BlackBold.copyWith(
                  color: ColorsManager.mainBlue,
                ),
              ),
              verticalSpace(10.h),
              Text(
                Strings.weAreExcited,
                style: TextStyles.font14GrayRegular,
              ),
            ],
          ),
          verticalSpace(25.h),
          //login
          AppTextFormField(
            hintText: Strings.email,
            validator: (String? value) {},
          ),
          verticalSpace(12.h),
          //password
          AppTextFormField(
            hintText: Strings.password,
            validator: (String? value) {},
          ),
          verticalSpace(14.h),
          //password
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
            onPressed: () {},
          ),
          verticalSpace(30.h),
          const SectionTermsAndConditions(),
          verticalSpace(12.h),
          const SectionAlreadyHaveAnAccount(),
        ],
      ),
    );
  }
}
