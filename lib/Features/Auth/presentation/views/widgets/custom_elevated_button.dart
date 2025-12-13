import 'package:dashbaord_sou_okaz/core/helpers/functions/responsive.dart';
import 'package:dashbaord_sou_okaz/core/utils/app_colors.dart';
import 'package:dashbaord_sou_okaz/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.title, this.onPressed});
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: responsiveFontSize(context, 0.061, 0),
      // height:  55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
        ),
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style: AppTextStyles.medium18.copyWith(
              fontSize: responsiveFontSize(context, 0, 0.051),
            ),
          ),
        ),
      ),
    );
  }
}
