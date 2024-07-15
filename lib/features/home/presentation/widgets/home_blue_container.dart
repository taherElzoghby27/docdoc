import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class HomeBlueContainer extends StatelessWidget {
  const HomeBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 197.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset('assets/images/background.png'),
          Positioned(
            bottom: 0,
            left: 20.w,
            child: Column(
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctor',
                  style: TextStyles.font18WhiteMedium,
                ),
                verticalSpace(12.h),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Find Nearby',
                    style: TextStyles.font12BlueRegular,
                  ),
                ),
                verticalSpace(8.h),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 20.w,
            child: Image.asset('assets/images/doctor.png'),
          ),
        ],
      ),
    );
  }
}
