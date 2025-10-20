import 'package:dashbaord_sou_okaz/Features/splash/presentation/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DashboardSouOkaz());
}

class DashboardSouOkaz extends StatelessWidget {
  const DashboardSouOkaz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
