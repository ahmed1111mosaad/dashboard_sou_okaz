import 'package:dashbaord_sou_okaz/Features/Auth/presentation/views/widgets/recovery_passowrd_body.dart';
import 'package:flutter/material.dart';

class RecoveryPassword extends StatelessWidget {
  const RecoveryPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return
    //  RecoveryPaswordBlocConsumer(
    //   child:
    Scaffold(resizeToAvoidBottomInset: true, body: RecoveryPassowrdBody());
    // return RecoveryPaswordBlocConsumer(
    //   child: Scaffold(
    //     resizeToAvoidBottomInset: true,
    //     body: RecoveryPassowrdBody(),
    //   ),
    // );
  }
}
