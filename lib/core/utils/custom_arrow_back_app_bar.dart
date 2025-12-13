import 'package:dashbaord_sou_okaz/core/helpers/functions/responsive.dart';
import 'package:flutter/material.dart';


class CustomArrowBackAppBar extends StatelessWidget {
  const CustomArrowBackAppBar({super.key, this.isLogin = false});
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:  Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        child: SizedBox(
          width: responsiveFontSize(context, 0, 0.10),
          height: responsiveFontSize(context, 0.052, 0),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: CircleBorder(),
            ),
            onPressed: () {
              if (isLogin) {
              } else {
                Navigator.of(context).pop();
              }
            },
            icon: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Icon(
                Icons.arrow_back_ios,
                size: 17,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
