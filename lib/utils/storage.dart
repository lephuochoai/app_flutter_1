enum BoxKey { isLoggedIn, token, refreshToken }

class IsLoggedIn {
  bool isLoggedIn;

  IsLoggedIn({required this.isLoggedIn});
}

class TokenUser {
  String token = '';
  String refreshToken = '';

  TokenUser({required this.token, required this.refreshToken});
}
