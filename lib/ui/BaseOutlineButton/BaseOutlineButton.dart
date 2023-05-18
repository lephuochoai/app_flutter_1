import 'package:flutter/material.dart';

class BaseOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  bool fullWidth = false;

  BaseOutlineButton(
      {required this.text, required this.onPressed, this.fullWidth = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 1, color: Colors.white)),
      child: MaterialButton(
        minWidth: fullWidth ? double.infinity : double.tryParse('100'),
        height: 40,
        onPressed: onPressed,
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
