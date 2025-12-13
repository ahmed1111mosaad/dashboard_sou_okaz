import 'package:dashbaord_sou_okaz/Features/Auth/presentation/views/widgets/signin_view_body.dart';
import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: true, body: SigninViewBody());
    // return SignInBlocConsumer(
    //   child: Scaffold(
    //     resizeToAvoidBottomInset: true,
    //     body: SigninViewBody(),
    //   ),
    // );
  }
}
