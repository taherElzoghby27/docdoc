import 'package:doc_doc/core/helpers/spacing.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeDoctorsSpecial extends StatelessWidget {
  const HomeDoctorsSpecial({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: index == 0 ? 0 : 12,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg?crop=0.66698xw:1xh;center,top&resize=1200:*',
                    ),
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Randy Wigham',
                        style: TextStyles.font18DarkBlueBold.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      verticalSpace(5),
                      Text(
                        'General | RSUD Gatot Subroto',
                        style: TextStyles.font12GrayMedium,
                      ),
                      verticalSpace(5),
                      Row(
                        children: [
                          SvgPicture.asset('assets/svgs/star.svg'),
                          Text(
                            ' 4.8 (4,279 reviews)',
                            style: TextStyles.font12GrayRegular,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
