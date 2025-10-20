import 'dart:async';
import 'package:dashbaord_sou_okaz/Features/home/presentation/views/home_screen.dart';
import 'package:dashbaord_sou_okaz/core/helpers/functions/navigator_with_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _animation2 = CurvedAnimation(
      parent: _controller2,
      curve: Curves.easeInOut,
    );

    Future.delayed(Duration(seconds: 1), () {
      _controller.forward();
    });
    Future.delayed(Duration(milliseconds: 1400), () {
      _controller2.forward();
    });

    Timer(const Duration(seconds: 6), () {
      // if (FirebaseAuth.instance.currentUser == null) {
      //   navigatorWithFadeAnimationPushReplacement(context, SigninView());
      // } else {
      //   navigatorWithFadeAnimationPushReplacement(context, HomeScreen());
      // }
        navigatorWithFadeAnimationPushReplacement(context, HomeScreen());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xff0f2733),
            child: SizedBox.expand(
              child: RiveAnimation.asset(
                'assets/rive/splash_v1.riv',
                // 'assets/rive/splash.riv',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: ScaleTransition(
                    scale: _animation,
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Sou Okaz",
                          style: TextStyle(
                            fontFamily: 'Cinzel',
                            color: Color(0xFFdfaf67),
                            fontSize: MediaQuery.of(context).size.width * 0.13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: _animation2,
                  child: ScaleTransition(
                    scale: _animation2,
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Dashboard",
                          style: TextStyle(
                            fontFamily: 'Cinzel',
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.07,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
