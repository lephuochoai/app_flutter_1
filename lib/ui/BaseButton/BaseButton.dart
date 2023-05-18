import 'package:flutter/material.dart';

import '../../utils/func.dart';

class BaseButton extends StatelessWidget {
  VoidCallback onPressed;
  Widget child;
  String type = 'primary';

  BaseButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.type = 'primary'})
      : super(key: key);

  late final bgButton =
      type == 'primary' ? hexToColor('#2368f6') : hexToColor('#F2F5F6');
  late final textColorButton =
      type == 'primary' ? Colors.white : Colors.black87;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: bgButton, // background color
          foregroundColor: textColorButton, // text color
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // rounded corners
          ),
          shadowColor: Colors.transparent),
      child: child,
    );
  }
}
