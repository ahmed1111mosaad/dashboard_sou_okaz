import 'package:dashbaord_sou_okaz/Features/Auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/presentation/views/recovery_password.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/presentation/views/signup_view.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:dashbaord_sou_okaz/core/helpers/functions/navigator_with_slide_animation.dart';
import 'package:dashbaord_sou_okaz/core/helpers/functions/responsive.dart';
import 'package:dashbaord_sou_okaz/core/utils/app_text_styles.dart';
import 'package:dashbaord_sou_okaz/core/utils/custom_arrow_back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? email;
  String? password;
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsivePaddingWithWidth(context, 0.05),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              autovalidateMode: autovalidateMode,
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomArrowBackAppBar(isLogin: true),
                  SizedBox(height: responsiveFontSize(context, 0.035, 0)),

                  // ? Title
                  Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: responsiveFontSize(context, 0, 0.09),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Welcome Back You,ve Been Missed!",
                        style: AppTextStyles.regular16.copyWith(
                          fontSize: responsiveFontSize(context, 0, 0.045),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: responsiveFontSize(context, 0.06, 0)),

                  // ? Email
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: responsiveFontSize(context, 0, 0.045),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      String pattern =
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                      RegExp regex = RegExp(pattern);

                      if (value!.isEmpty) {
                        return "Please enter the required field";
                      } else if (!regex.hasMatch(value)) {
                        return "Please enter an valid email";
                      }
                      return null;
                    },
                    isPassword: false,
                    isSearchField: false,
                  ),
                  SizedBox(height: responsiveFontSize(context, 0.02, 0)),

                  // ? Password
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: responsiveFontSize(context, 0, 0.045),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  CustomTextFormField(
                    controller: passwordController,
                    obscureText: true,
                    isPassword: true,
                    onChanged: (value) {
                      password = value;
                      passwordController.text = value;
                    },
                    validator: (value) {
                      RegExp regExp = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                      );
                      if (value!.isEmpty) {
                        return "Please enter the required field";
                      } else if (value.length < 8) {
                        return "Minimum of 8 characters";
                      } else if (!regExp.hasMatch(value)) {
                        return "Uppercase, lowercase, Symbol, letters and one number";
                      }
                      return null;
                    },
                    isSearchField: false,
                  ),

                  const SizedBox(height: 4),

                  // ? Forget Password
                  GestureDetector(
                    onTap: () {
                      passwordController.clear();
                      navigatorWithSlideAnimation(
                        context,
                        const RecoveryPassword(),
                        const Offset(1, 0),
                      );
                    },
                    child: Text(
                      "Recovery Password",
                      style: AppTextStyles.regular13.copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: responsiveFontSize(context, 0, 0.036),
                      ),
                    ),
                  ),
                  SizedBox(height: responsiveFontSize(context, 0.025, 0)),

                  // ? Sign In with email and password Button
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      title: "Sign In",
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          key.currentState!.save();
                          BlocProvider.of<SignInCubit>(
                            context,
                          ).signInWithEmailAndPassword(
                            email: email!,
                            password: password!,
                          );
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                  // ? Don't Have Account
                  Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No Account',
                            style: AppTextStyles.regular13.copyWith(
                              fontSize: responsiveFontSize(context, 0, 0.034),
                            ),
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () {
                              navigatorWithSlideAnimation(
                                context,
                                const SignUpView(),
                                Offset(1, 0),
                              );
                            },
                            child: Text(
                              "Sign Up for free",
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    decoration: TextDecoration.underline,
                                    fontSize: responsiveFontSize(
                                      context,
                                      0,
                                      0.038,
                                    ),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
