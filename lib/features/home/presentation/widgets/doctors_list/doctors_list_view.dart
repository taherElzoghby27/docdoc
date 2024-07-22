
import 'package:doc_doc/features/home/data/models/specializations_model.dart';
import 'package:flutter/material.dart';

import 'doctor_item.dart';

class DoctorsListview extends StatelessWidget {
  const DoctorsListview({
    super.key,
    required this.doctors,
  });
  final List<DoctorModel> doctors;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctors.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return DoctorItem(
            index: index,
            doctor: doctors[index],
          );
        },
      ),
    );
  }
}
