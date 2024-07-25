import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/const_strings.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';

class SectionAlreadyHaveAnAccount extends StatelessWidget {
  const SectionAlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: Strings.alreadyHaveAnAccount,
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.pushReplacementNamed(
                    Routes.signUpScreen,
                  ),
            text: Strings.signUp,
            style: TextStyles.font13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
