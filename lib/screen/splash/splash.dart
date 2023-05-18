import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/auth.dart';
import 'package:flutter_application_1/models/index.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final authState = context.watch<AuthState>();

    if (appState.initialized) {
      Future.delayed(const Duration(seconds: 2), () async {
        await authState.getAuthLocalStorage();
        appState.initialApp();
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FractionallySizedBox(
                widthFactor: 0.5,
                child: Image.asset('assets/images/logos/logo.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
