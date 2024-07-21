import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctor_item.dart';

class HomeDoctorsSpecial extends StatelessWidget {
  const HomeDoctorsSpecial({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            doctorsSuccess: (doctors) {
              return ListView.builder(
                itemCount: doctors.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return DoctorItem(
                    index: index,
                    doctor: doctors[index],
                  );
                },
              );
            },
            doctorsError: (error) {
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
