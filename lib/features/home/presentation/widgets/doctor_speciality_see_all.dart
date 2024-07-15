
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DoctorSpecialitySeeAll extends StatelessWidget {
  const DoctorSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Doctor Speciality',
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See All',
            style: TextStyles.font12BlueRegular,
          ),
        ),
      ],
    );
  }
}
