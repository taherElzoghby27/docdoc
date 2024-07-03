import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button_section.dart';
import 'center_page_section.dart';
import 'doc_doc_logo_section.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: ListView(
        children: [
          const DocdocLogoSection(),
          SizedBox(height: 35.h),
          const CenterPageSection(),
          const ButtonSection(),
        ],
      ),
    );
  }
}
