import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final String? hint;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChange;
  final void Function(String?)? onSaved;

  const BaseTextField(
      {super.key,
      this.hint,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.controller,
      this.onChange,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      onSaved: onSaved,
      decoration: InputDecoration(
          // border: const OutlineInputBorder(
          //   borderSide: BorderSide()
          // ),
          // errorBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(999),
          //     borderSide: BorderSide(color: Colors.red, width: 1.0)),
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(999),
          //     borderSide: BorderSide(color: Colors.white, width: 1.0)),
          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(999),
          //     borderSide: BorderSide(color: Colors.white, width: 1.0)),
          // focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(999),
          //     borderSide: BorderSide(color: Colors.white, width: 1.0)),
          hintText: hint.toString().isNotEmpty ? hint : '',
          // hintStyle: const TextStyle(color: Colors.white),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
      obscureText: obscureText,
      // style: const TextStyle(color: Colors.white),
      controller: controller,
      validator: validator,
    );
  }
}
