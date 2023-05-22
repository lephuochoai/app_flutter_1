import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/func.dart';

class NavBarIcon extends StatelessWidget {
  bool isActive = false;
  String iconPath = '';
  NavBarIcon({Key? key, required this.isActive, required this.iconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SvgPicture.asset(
        iconPath,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          hexToColor(isActive ? '#1DAEFF' : '#67686D'),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
