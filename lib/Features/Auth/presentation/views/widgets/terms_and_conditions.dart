import 'package:dashbaord_sou_okaz/Features/Auth/presentation/views/widgets/check_mark.dart';
import 'package:dashbaord_sou_okaz/core/helpers/functions/responsive.dart';
import 'package:dashbaord_sou_okaz/core/utils/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isAccepted = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      child: Row(
        children: [
          CheckList(
            onChanged: (bool value) {
              isAccepted = value;
              widget.onChanged(isAccepted);
              setState(() {});
            },
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "I agree to Sou Okaz's",
                    style: AppTextStyles.regular14.copyWith(
                      fontSize: responsiveFontSize(context, 0, 0.035),
                    ),
                  ),
                  TextSpan(
                    text: " Privacy Policy",
                    style: AppTextStyles.regular16.copyWith(
                      decoration: TextDecoration.underline,
                      fontSize: responsiveFontSize(context, 0, 0.037),
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(
                    text: " And",
                    style: AppTextStyles.regular14.copyWith(
                      fontSize: responsiveFontSize(context, 0, 0.035),
                    ),
                  ),
                  TextSpan(
                    text: " Terms Of Use.",
                    style: AppTextStyles.regular16.copyWith(
                      decoration: TextDecoration.underline,
                      fontSize: responsiveFontSize(context, 0, 0.037),
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
