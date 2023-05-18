import 'package:flutter/material.dart';

class BaseGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool disabled;

  const BaseGradientButton(
      {required this.text, required this.onPressed, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xfff879b4),
            Color(0xfff8666b),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 50,
        onPressed: disabled ? null : onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
