import 'package:flutter/material.dart';

import 'doctor_speciality_listview.dart';
import 'doctor_speciality_see_all.dart';

class HomeDoctorSpeciality extends StatelessWidget {
  const HomeDoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DoctorSpecialitySeeAll(),
        DoctorSpecialityListView(),
      ],
    );
  }
}
