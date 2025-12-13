// import 'package:dashbaord_sou_okaz/Features/Auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
// import 'package:dashbaord_sou_okaz/Features/Auth/presentation/cubits/sign_in_cubit/sign_in_states.dart';
// import 'package:dashbaord_sou_okaz/Features/home/presentation/views/home_screen.dart';
// import 'package:dashbaord_sou_okaz/core/helpers/functions/navigator_with_fade_animation.dart';
// import 'package:dashbaord_sou_okaz/core/utils/snackbar/show_failure.dart';
// import 'package:dashbaord_sou_okaz/core/utils/snackbar/show_success.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


// class SignInBlocConsumer extends StatelessWidget {
//   const SignInBlocConsumer({super.key, required this.child});
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SignInCubit, SignInStates>(
//       listener: (context, state) {
//         if (state is SuccessSignInState) {
//           showSuccess(context, title: "Success Sign In", description: '');
//           navigatorWithFadeAnimationPushReplacement(context, HomeScreen());
//         }
//         if (state is FailureSignInState) {
//           showFailure(context, title: state.errMessage, description: '');
//           print(state.errMessage);
//         }
//       },
//       builder: (context, state) {
//         return ModalProgressHUD(
//           color: const Color.fromARGB(255, 255, 246, 245),
//           progressIndicator: CircularProgressIndicator(
//             color: Colors.deepOrange,
//           ),
//           inAsyncCall: state is LoadingSignInState,
//           child: child,
//         );
//       },
//     );
//   }
// }
