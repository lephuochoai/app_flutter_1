import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../utils/storage.dart';

class AuthState extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _token = '';
  String _refreshToken = '';
  var _userInfo;

  get userInfo => _userInfo;
  get isLoggedIn => _isLoggedIn;
  get token => _token;
  get refreshToken => _refreshToken;

  set setUserInfo(info) {
    _userInfo = info;
    notifyListeners();
  }

  Future login({String token = '', String refreshToken = ''}) async {
    print('1111, $token, $refreshToken');

    _isLoggedIn = true;
    _token = token;
    _refreshToken = refreshToken;

    final boxAuth = await Hive.openBox('auth');
    boxAuth.put(BoxKey.isLoggedIn.toString(), true);
    boxAuth.put(BoxKey.token.toString(), token);
    boxAuth.put(BoxKey.refreshToken.toString(), refreshToken);
    notifyListeners();
  }

  Future getAuthLocalStorage() async {
    final boxAuth = await Hive.openBox('auth');
    final getIsLoggedIn =
        await boxAuth.get(BoxKey.isLoggedIn.toString()) ?? false;
    final getToken = await boxAuth.get(BoxKey.token.toString()) ?? '';
    final getRefreshToken =
        await boxAuth.get(BoxKey.refreshToken.toString()) ?? '';

    _isLoggedIn = getIsLoggedIn;
    _token = getToken;
    _refreshToken = getRefreshToken;
    notifyListeners();
  }
}
