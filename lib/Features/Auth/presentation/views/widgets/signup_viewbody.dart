import 'package:dashbaord_sou_okaz/Features/Auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:dashbaord_sou_okaz/core/helpers/functions/responsive.dart';
import 'package:dashbaord_sou_okaz/core/utils/app_text_styles.dart';
import 'package:dashbaord_sou_okaz/core/utils/custom_arrow_back_app_bar.dart';
import 'package:dashbaord_sou_okaz/core/utils/snackbar/show_failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewbody extends StatefulWidget {
  const SignupViewbody({super.key});

  @override
  State<SignupViewbody> createState() => _SignupViewbodyState();
}

class _SignupViewbodyState extends State<SignupViewbody> {
  String? name;
  String? email;
  String? password;
  bool isTermsAccepted = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomArrowBackAppBar(),
                  SizedBox(height: MediaQuery.of(context).size.height * .04),
                  // ? Create Account
                  Center(
                    child: Text(
                      'Create Account',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: responsiveFontSize(context, 0, 0.09),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  // ? Let's create account together
                  Center(
                    child: Text(
                      "Let's create account together",
                      style: AppTextStyles.regular16.copyWith(
                        fontSize: responsiveFontSize(context, 0, 0.05),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .05),
                  // ? Full Name
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Full Name",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: responsiveFontSize(context, 0, 0.045),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  CustomTextFormField(
                    isPassword: false,
                    obscureText: false,
                    onChanged: (value) {
                      name = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter the required field";
                      }
                      return null;
                    },
                    isSearchField: false,
                  ),
                  SizedBox(height: 18.0),

                  // ? Email Address
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email Address",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: responsiveFontSize(context, 0, 0.045),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  CustomTextFormField(
                    obscureText: false,
                    onChanged: (String value) {
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
                      } else {
                        return null;
                      }
                    },
                    isPassword: false,
                    isSearchField: false,
                  ),
                  SizedBox(height: 18.0),
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
                  SizedBox(height: 6),
                  CustomTextFormField(
                    obscureText: true,
                    validator: (value) {
                      RegExp regExp = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                      );
                      if (value!.length < 8) {
                        return "Minimum of 8 characters";
                      } else if (!regExp.hasMatch(value)) {
                        return "Uppercase, lowercase, Symbol, letters and one number";
                      } else if (value.isEmpty) {
                        return "Please enter the required field";
                      }
                      return null;
                    },
                    onChanged: (String value) {
                      password = value;
                    },
                    isPassword: true,
                    isSearchField: false,
                  ),
                  SizedBox(height: 10),

                  SizedBox(height: 25),
                  // ! Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      title: "Sign Up",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          BlocProvider.of<SignUpCubit>(
                            context,
                          ).createUserWithEmailAndPassowrd(
                            email: email!,
                            password: password!,
                            name: name!,
                            phoneNumber: '',
                          );
                        } else {
                          autovalidateMode = AutovalidateMode.always;

                          setState(() {});
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: AppTextStyles.regular12,
                      ),
                      GestureDetector(
                        onTap: () {
                          // هنا بدل Pop عادية → Pop مع data
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Sign In",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
