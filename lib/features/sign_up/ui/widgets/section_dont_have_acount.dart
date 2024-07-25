import 'package:flutter/material.dart';

import '../../../../core/helpers/const_strings.dart';
import '../../../../core/theming/styles.dart';

class SectionDontHaveAccount extends StatelessWidget {
  const SectionDontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: Strings.dontHaveAnAccount,
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: Strings.signIn,
            style: TextStyles.font13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
