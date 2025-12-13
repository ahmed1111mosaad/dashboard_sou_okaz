import 'package:dashbaord_sou_okaz/core/assets/assets.dart';
import 'package:dashbaord_sou_okaz/core/helpers/functions/responsive.dart';
import 'package:dashbaord_sou_okaz/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.isPassword,
    this.onChanged,
    this.validator,
    required this.obscureText,
    this.keyboardType,
    this.controller,
    required this.isSearchField,
  });
  final bool isPassword;
  final Function(String)? onChanged;
  bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool isSearchField;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      cursorColor: Theme.of(context).primaryColor,
      cursorHeight: 24,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: responsiveFontSize(context, 0, 0.046),
        fontFamily: 'Airbnb Cereal App',
        fontWeight: FontWeight.w400,
        height: 1.14,
      ),
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Theme.of(context).colorScheme.error,
          fontSize: responsiveFontSize(context, 0, 0.031),
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 255, 214, 212),
            width: 2,
          ),
        ),
        // contentPadding: EdgeInsets.symmetric(vertical: 18.0),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 255, 214, 212),
            width: 2,
          ),
        ),

        prefixIcon: widget.isSearchField
            ? Image.asset(Assets.assetsImagesSearchIcon)
            : null,
        hintText: widget.isSearchField ? 'Looking for shoes' : null,
        hintStyle: AppTextStyles.regular14.copyWith(
          fontSize: responsiveFontSize(context, 0, 0.04),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  widget.obscureText = !widget.obscureText;
                  setState(() {});
                },
                icon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    widget.obscureText ? Icons.remove : Icons.remove_red_eye,
                    size: 17,
                    color: widget.obscureText
                        ? Colors.grey
                        : const Color.fromARGB(255, 220, 178, 178),
                  ),
                ),
              )
            : SizedBox(),
      ),
    );
  }
}

class FontAwesomeIcons {}
