import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/specializations_model.dart';
import 'doctors_shimmer_loading.dart';
import 'doctors_specializations_loading_shimmer.dart';
import 'list_view_specializations.dart';

class DoctorSpecialityBlocBuilder extends StatelessWidget {
  const DoctorSpecialityBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (context, state) =>
          state is SpecializationLoading ||
          state is SpecializationSuccess ||
          state is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: loadingMethod,
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

  Widget loadingMethod() {
    return const Column(
      children: [
        SpecialityShimmerLoading(),
        DoctorsShimmerLoading(),
      ],
    );
  }
}
