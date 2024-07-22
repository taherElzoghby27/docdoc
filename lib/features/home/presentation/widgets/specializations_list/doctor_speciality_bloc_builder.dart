import 'package:doc_doc/core/helpers/spacing.dart';
import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/specializations_model.dart';
import '../doctors_list/doctors_shimmer_loading.dart';
import 'doctors_specializations_loading_shimmer.dart';
import 'list_view_specializations.dart';

class DoctorSpecialityBlocBuilder extends StatelessWidget {
  const DoctorSpecialityBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoading ||
          current is SpecializationSuccess ||
          current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () => loadingMethod(context),
          specializationsSuccess: successMethod,
          specializationsError: errorMethod,
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget errorMethod(error) {
    return const SizedBox.shrink();
  }

  Widget successMethod(responseSpecializationsModel) {
    List<SpecializationModel> specializations =
        responseSpecializationsModel.specializations;
    return ListviewSpecializations(
      specializations: specializations,
    );
  }

  Widget loadingMethod(context) {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }
}
