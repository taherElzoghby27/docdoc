import 'package:doc_doc/core/helpers/const_strings.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/material.dart';

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
            text: Strings.signUp,
            style: TextStyles.font13BlueSemiBold,
          ),
        ],
      ),
    );
  }
}
