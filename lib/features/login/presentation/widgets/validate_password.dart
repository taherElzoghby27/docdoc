import 'package:doc_doc/core/helpers/const_strings.dart';
import 'package:doc_doc/core/helpers/spacing.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ValidatePassword extends StatelessWidget {
  const ValidatePassword({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        validateComponent(Strings.atLeast1LowerCaseLetter, hasLowerCase),
        verticalSpace(2),
        validateComponent(Strings.atLeast1UpperCase, hasUpperCase),
        verticalSpace(2),
        validateComponent(Strings.atLeast1SpecialLetter, hasSpecialCharacters),
        verticalSpace(2),
        validateComponent(Strings.atLeast1Number, hasNumber),
        verticalSpace(2),
        validateComponent(Strings.atLeast8Character, hasMinLength),
      ],
    );
  }

  validateComponent(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.close,
          color: isValid ? ColorsManager.green : ColorsManager.red,
        ),
        horizontalSpace(10.w),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: isValid ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: isValid ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
