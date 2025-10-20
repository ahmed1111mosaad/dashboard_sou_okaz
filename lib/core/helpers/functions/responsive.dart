import 'package:flutter/material.dart';

double responsiveFontSize(
  BuildContext context,
  double scaleHeight,
  double scaleWidth,
) {
  return MediaQuery.of(context).size.height * scaleHeight +
      MediaQuery.of(context).size.width * scaleWidth;
}

double responsivePaddingWithWidth(BuildContext context, double scaleWidth) {
  return MediaQuery.of(context).size.width * scaleWidth;
}
double responsivePaddingWithHeight(BuildContext context, double scaleHeight) {
  return MediaQuery.of(context).size.height * scaleHeight;
}
