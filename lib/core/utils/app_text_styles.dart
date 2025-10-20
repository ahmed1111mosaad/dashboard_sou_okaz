import 'package:flutter/material.dart';

/*

* FontWeight.w300 → Light

? FontWeight.w400 → Normal / Regular 

? FontWeight.w500 → Medium

! FontWeight.w600 → SemiBold / DemiBold

! FontWeight.w700 → Bold

! FontWeight.w800 → ExtraBold / UltraBold

*/

abstract class AppTextStyles {
  static const TextStyle medium40 = TextStyle(
    color: Color(0xFF1A242F),
    fontSize: 40,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle regular20 = TextStyle(
    color: Color(0xFF707B81),
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle medium28 = TextStyle(
    color: Color(0xFF1A242F),
    fontSize: 28,
    fontWeight: FontWeight.bold
  );
  static const TextStyle regular16 = TextStyle(
    color: Color(0xFF707B81),
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle medium16 = TextStyle(
    color: Color(0xFF1A242F),
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle regular13 = TextStyle(
    color: Color(0xFF707B81),
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle regular12 = TextStyle(
    color: Color(0xFF707B81),
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle medium18 = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle medium12 = TextStyle(
    color: Color(0xFF1A242F),
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle medium24 = TextStyle(
    color: Color(0xFF1A242F),
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle medium14 = TextStyle(
    color: Color(0xFF1A242F),
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle regular14 = TextStyle(
    color: Color(0xFF707B81),
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle bold16 = TextStyle(
    color: Color(0xFF616A6B) /* Grayscale-600 */,
    fontSize: 16,
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w700,
  );
  static const TextStyle medium20 = TextStyle(
    color: Color(0xFF1A242F),
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
}
