import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/specializations_model.dart';
import 'specialization_item.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (context, state) =>
            state is SpecializationLoading ||
            state is SpecializationSuccess ||
            state is SpecializationError,
        builder: (context, state) {
          return state.maybeWhen(
            specializationsLoading: () {
              return const CircularProgressIndicator();
            },
            specializationsSuccess: (responseSpecializationsModel) {
              List<SpecializationModel> specializations =
                  responseSpecializationsModel.specializations;
              return ListView.builder(
                itemCount: specializations.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SpecializationItem(
                    index: index,
                    specializationModel: specializations[index],
                  );
                },
              );
            },
            specializationsError: (error) {
              return const SizedBox.shrink();
            },
            orElse: () {
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
