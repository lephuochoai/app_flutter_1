import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../utils/storage.dart';

class AuthState extends ChangeNotifier {
  bool _isLoggedIn = false;
  var _userInfo;

  get userInfo => _userInfo;
  get isLoggedIn => _isLoggedIn;

  set setUserInfo(info) {
    _userInfo = info;
    notifyListeners();
  }

  Future login(bool status) async {
    _isLoggedIn = status;

    final boxAuth = await Hive.openBox('auth');
    boxAuth.put(BoxKey.isLoggedIn.toString(), status);
    notifyListeners();
  }

  Future getAuthLocalStorage() async {
    final boxAuth = await Hive.openBox('auth');
    final getIsLoggedIn =
        await boxAuth.get(BoxKey.isLoggedIn.toString()) ?? false;

    _isLoggedIn = getIsLoggedIn;
    notifyListeners();
  }
}
