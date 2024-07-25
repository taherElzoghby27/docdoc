import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/const_strings.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

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
