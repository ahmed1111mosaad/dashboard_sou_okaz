import 'package:dashbaord_sou_okaz/Features/Auth/presentation/views/signin_view.dart';
import 'package:dashbaord_sou_okaz/core/helpers/functions/navigator_with_slide_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            print("Signed out successfully");
            navigatorWithSlideAnimationPushReplacement(
              context,
              SigninView(),
              Offset(0, 1),
            );
          },
          child: Text('Sign out'),
        ),
      ),
    );
  }
}
