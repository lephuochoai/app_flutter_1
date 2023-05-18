import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _initialized = true;

  get initialized => _initialized;

  Future initialApp() async {
    _initialized = false;
    notifyListeners();
  }
}
