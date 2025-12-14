import 'package:dashbaord_sou_okaz/Features/Auth/domain/repo/auth_repo.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:dashbaord_sou_okaz/Features/splash/presentation/views/splash_screen.dart';
import 'package:dashbaord_sou_okaz/core/services/service_locator.dart';
import 'package:dashbaord_sou_okaz/core/services/shared_preferences_singleton.dart';
import 'package:dashbaord_sou_okaz/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreferencesSingleton.init(); 
  setup();
  runApp(DashboardSouOkaz());
}

class DashboardSouOkaz extends StatelessWidget {
  const DashboardSouOkaz({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpCubit(getIt<AuthRepo>())),
        BlocProvider(create: (context) => SignInCubit(getIt<AuthRepo>())),
        BlocProvider(
          create: (context) => ResetPasswordCubit(getIt<AuthRepo>()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white.withAlpha(248)),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
