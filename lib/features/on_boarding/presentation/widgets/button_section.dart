import 'package:doc_doc/core/helpers/const_strings.dart';
import 'package:doc_doc/core/helpers/extensions.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.hintOnBoarding,
          style: TextStyles.font12GrayRegular,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                ColorsManager.mainBlue,
              ),
              //tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: WidgetStateProperty.all(
                Size(double.infinity, 52.h),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.sp),
                  ),
                ),
              ),
            ),
            onPressed: () => context.pushReplacementNamed(Routes.loginScreen),
            child: Text(
              Strings.getStarted,
              style: TextStyles.font18WhiteMedium,
            ),
          ),
        ),
      ],
    );
  }
}
