import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String text;
  final bool isUpperCase;
  final IconData prefix;
  final IconData? suffix;
  final Function()? onPressed;
  final double? radius;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isPassword;

  const MyTextFormField({
    super.key,
    required this.controller,
    required this.type,
    required this.text,
    this.isUpperCase = true,
    required this.prefix,
    this.suffix,
    this.onPressed,
    this.radius,
    this.onTap,
    this.onFieldSubmitted,
    this.onChanged,
    required this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validator,
      obscureText: isPassword,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius!,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        labelText: isUpperCase ? text.toUpperCase() : text.toLowerCase(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
      ),
    );
  }
}
