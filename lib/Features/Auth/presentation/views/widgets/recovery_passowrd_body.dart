import 'package:dashbaord_sou_okaz/Features/Auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:dashbaord_sou_okaz/Features/Auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:dashbaord_sou_okaz/core/helpers/functions/responsive.dart';
import 'package:dashbaord_sou_okaz/core/utils/app_text_styles.dart';
import 'package:dashbaord_sou_okaz/core/utils/custom_arrow_back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecoveryPassowrdBody extends StatefulWidget {
  const RecoveryPassowrdBody({super.key});

  @override
  State<RecoveryPassowrdBody> createState() => _RecoveryPassowrdBodyState();
}

class _RecoveryPassowrdBodyState extends State<RecoveryPassowrdBody> {
  String? email;
  GlobalKey<FormState> formKey = GlobalKey();
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomArrowBackAppBar(),
                  SizedBox(height: responsiveFontSize(context, 0.04, 0)),
                  Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Recovery Password",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: responsiveFontSize(context, 0, 0.066),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Please Enter Your Phone Number",

                        style: AppTextStyles.regular16.copyWith(
                          fontSize: responsiveFontSize(context, 0, 0.041),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "To Receive a Verification Code",
                        style: AppTextStyles.regular16.copyWith(
                          fontSize: responsiveFontSize(context, 0, 0.041),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .05),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email Address",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: responsiveFontSize(context, 0, 0.04),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    onChanged: (value) => email = value,
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
                  SizedBox(height: MediaQuery.of(context).size.height * .015),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      title: 'Continue',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          // context.read<ResetPasswordCubit>().resetPassword(
                          //   email: email!,
                          // );
                          setState(() {});
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
