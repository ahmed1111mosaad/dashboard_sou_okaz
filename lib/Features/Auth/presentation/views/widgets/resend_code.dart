import 'package:dashbaord_sou_okaz/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';


class ResendCode extends StatelessWidget {
  const ResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "forgot Password Resend Code",
      style: AppTextStyles.bold16.copyWith(
        color: Colors.cyan,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
