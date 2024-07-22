import 'package:doc_doc/features/home/data/models/specializations_model.dart';
import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctors_list_view.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorsSuccess || current is DoctorsError,
      builder: (context, state) {
        return state.maybeWhen(
          doctorsSuccess: successMethod,
          doctorsError: errorMethod,
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

  Widget successMethod(List<DoctorModel> doctors) {
    return DoctorsListview(doctors: doctors);
  }
}
