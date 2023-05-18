import 'dart:ui';

import 'package:flutter/material.dart';

Color hexToColor(String hexString) {
  return Color(int.parse(hexString.substring(1, 7), radix: 16) + 0xFF000000);
}
