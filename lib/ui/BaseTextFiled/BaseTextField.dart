import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final hint;
  final bool obscureText;
  final prefixIcon;
  final suffixIcon;
  final validator;
  final controller;
  final onChange;

  const BaseTextField({
    super.key,
    this.hint,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChange,
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
        validator: validator);
  }
}
