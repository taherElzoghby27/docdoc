import 'package:doc_doc/core/helpers/const_strings.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/material.dart';

class SectionTermsAndConditions extends StatelessWidget {
  const SectionTermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: Strings.byLogging,
            style: TextStyles.font13GrayRegular,
          ),
          TextSpan(
            text: Strings.termsAndConditions,
            style: TextStyles.font13DarkBlueMedium,
          ),
          TextSpan(
            text: Strings.and,
            style: TextStyles.font13GrayRegular.copyWith(height: 1.5),
          ), 
          TextSpan(
            text: Strings.privacyPolicy,
            style: TextStyles.font13DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
