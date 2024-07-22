import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/font_weight_helper.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Omar!',
              style: TextStyles.font18DarkBlueSemiBold.copyWith(
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            Text(
              'How Are you Today?',
              style: TextStyles.font12GrayRegular.copyWith(
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24.sp,
          backgroundColor: ColorsManager.moreLighterGray,
          child: SvgPicture.asset('assets/svgs/notifications.svg'),
        ),
      ],
    );
  }
}
