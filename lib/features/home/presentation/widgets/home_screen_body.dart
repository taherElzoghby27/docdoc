import 'package:doc_doc/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_blue_container.dart';
import 'home_doctor_speciality.dart';
import 'home_doctors_special.dart';
import 'home_top_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(
        20,
        16.0,
        20.0,
        28.0,
      ),
      child: Column(
        children: [
          const HomeTopBar(),
          const HomeBlueContainer(),
          verticalSpace(12.h),
          const HomeDoctorSpeciality(),
          verticalSpace(12.h),
          const HomeDoctorsSpecial(),
        ],
      ),
    );
  }
}
