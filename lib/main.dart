import 'package:dashbaord_sou_okaz/Features/splash/presentation/views/splash_screen.dart';
import 'package:dashbaord_sou_okaz/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(DashboardSouOkaz());
}

class DashboardSouOkaz extends StatelessWidget {
  const DashboardSouOkaz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
