import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/const_photos.dart';
import '../../../../core/helpers/const_strings.dart';
import '../../../../core/theming/styles.dart';

class DocdocLogoSection extends StatelessWidget {
  const DocdocLogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Svgs.logo),
        SizedBox(width: 8.w),
        Text(
          Strings.docdoc,
          style: TextStyles.font24BlackBold,
        ),
      ],
    );
  }
}
