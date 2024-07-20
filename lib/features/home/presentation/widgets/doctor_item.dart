import 'package:doc_doc/core/helpers/spacing.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/features/home/data/models/specializations_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({super.key, required this.index, required this.doctor});
  final int index;
  final DoctorModel doctor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: index == 0 ? 0 : 12,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(doctor.photo),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name,
                  style: TextStyles.font18DarkBlueBold.copyWith(
                    fontSize: 16,
                  ),
                ),
                verticalSpace(5),
                Text(
                  '${doctor.degree} | ${doctor.description}',
                  style: TextStyles.font12GrayMedium,
                ),
                verticalSpace(5),
                Row(
                  children: [
                    SvgPicture.asset('assets/svgs/star.svg'),
                    Text(
                      ' 4.8 (4,279 reviews)',
                      style: TextStyles.font12GrayRegular,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
