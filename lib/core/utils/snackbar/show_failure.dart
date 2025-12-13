import 'package:dashbaord_sou_okaz/core/helpers/functions/responsive.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';


void showFailure(
  BuildContext context, {
  required String title,
  required String description,
}) {
  return MotionToast(
    title: Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          style: TextStyle(
            color:Color.fromARGB(255, 255, 59, 59),
            
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    description: Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          description,
          style: TextStyle(color: Color(0xFF6E6E6E), fontSize: 13),
        ),
      ),
    ),
    animationCurve: Curves.easeInOut,
    icon: Icons.error,
    iconSize: responsiveFontSize(context, 0, 0.13),
    secondaryColor: Colors.red.shade600,
    
    primaryColor: const Color(0xFFFFE8E8), // أحمر فاتح
    width: MediaQuery.of(context).size.width * .9,
    height: MediaQuery.of(context).size.height * .09,
    displaySideBar: false,
  ).show(context);
}
