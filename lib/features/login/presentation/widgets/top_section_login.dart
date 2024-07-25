import '../../../../core/helpers/const_strings.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopSectionLogin extends StatelessWidget {
  const TopSectionLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
