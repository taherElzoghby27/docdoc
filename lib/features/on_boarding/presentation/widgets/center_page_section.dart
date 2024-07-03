import 'package:doc_doc/core/helpers/const_photos.dart';
import 'package:doc_doc/core/helpers/const_strings.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CenterPageSection extends StatelessWidget {
  const CenterPageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //background
        SvgPicture.asset(Svgs.backDocDoc),
        //doctor and opacity
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
            ),
          ),
          child: Image.asset(Assets.doc),
        ),
        //text
        Positioned(
          bottom: 30,
          right: 0,
          left: 0,
          child: Text(
            Strings.bestDoctorApp,
            style: TextStyles.font32BlueBold.copyWith(
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
