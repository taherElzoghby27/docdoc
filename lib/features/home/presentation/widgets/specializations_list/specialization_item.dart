import 'package:doc_doc/core/helpers/spacing.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/features/home/data/models/specializations_model.dart';
import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecializationItem extends StatelessWidget {
  const SpecializationItem({
    super.key,
    required this.index,
    required this.specializationModel,
  });
  final int index;
  final SpecializationModel specializationModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        context.read<HomeCubit>().changeCurrentPage(
              specializationModel.id,
            );
        context.read<HomeCubit>().getDoctors(
              id: specializationModel.id,
            );
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: index == 0 ? 0 : 10,
            ),
            child: Column(
              children: [
                index+1 == context.read<HomeCubit>().currentPage
                    ? CircleAvatar(
                        radius: 42.sp,
                        backgroundColor: ColorsManager.gray,
                        child: Image.asset('assets/images/brain.png'),
                      )
                    : CircleAvatar(
                        radius: 40.sp,
                        backgroundColor: ColorsManager.moreLighterGray,
                        child: Image.asset('assets/images/brain.png'),
                      ),
                verticalSpace(10),
                Text(
                  specializationModel.name,
                  style: index+1 == context.read<HomeCubit>().currentPage
                      ? TextStyles.font12DarkBlueRegular
                          .copyWith(fontWeight: FontWeight.bold)
                      : TextStyles.font12DarkBlueRegular,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
