import 'package:dashbaord_sou_okaz/core/helpers/functions/responsive.dart';
import 'package:flutter/material.dart';


class SignInWithButton extends StatelessWidget {
  const SignInWithButton({
    super.key,
    required this.image,
    required this.title,
    this.onPressed,
  });
  final String image;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
             
            ),
            SizedBox(width: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: responsiveFontSize(context, 0, 0.048),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
