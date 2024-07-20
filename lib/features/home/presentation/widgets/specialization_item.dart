import 'package:doc_doc/core/helpers/spacing.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/features/home/data/models/specializations_model.dart';
import 'package:doc_doc/features/home/logic/home_cubit.dart';
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
      onTap: () => context.read<HomeCubit>().changeCurrentPage(
            specializationModel.id,
          ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: index == 0 ? 0 : 10,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40.sp,
              backgroundColor: ColorsManager.moreLighterGray,
              child: Image.asset('assets/images/brain.png'),
            ),
            verticalSpace(10),
            Text(
              specializationModel.name,
              style: TextStyles.font12DarkBlueRegular,
            ),
          ],
        ),
      ),
    );
  }
}
