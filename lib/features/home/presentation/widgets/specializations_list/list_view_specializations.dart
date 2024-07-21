import 'package:doc_doc/features/home/data/models/specializations_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'specialization_item.dart';

class ListviewSpecializations extends StatelessWidget {
  const ListviewSpecializations({
    super.key,
    required this.specializations,
  });

  final List<SpecializationModel> specializations;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        itemCount: specializations.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SpecializationItem(
            index: index,
            specializationModel: specializations[index],
          );
        },
      ),
    );
  }
}
