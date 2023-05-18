import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/auth.dart';
import 'package:flutter_application_1/screen/auth/login/login.dart';
import 'package:flutter_application_1/screen/auth/register/register.dart';
import 'package:flutter_application_1/screen/settings/settings.dart';
import 'package:flutter_application_1/screen/splash/splash.dart';
import 'package:go_router/go_router.dart';

import '../models/index.dart';
import '../screen/main/main.dart';
import 'route-utils.dart';

class AppRouter {
  late AuthState authState;
  late AppState appState;

  AppRouter({required this.authState, required this.appState});

  late final GoRouter goRouter = GoRouter(
    refreshListenable: authState,
    debugLogDiagnostics: true,
    initialLocation: AppPage.main.toPath,
    routes: [
      GoRoute(
          name: AppPage.main.toName,
          path: AppPage.main.toPath,
          builder: (context, state) => const Main(),
          redirect: (BuildContext context, GoRouterState state) {
            final isLoggedIn = authState.isLoggedIn;
            if (!isLoggedIn) return AppPage.login.toPath;

            return null;
          },
          routes: [
            // GoRoute(
            //   name: AppPage.home.toName,
            //   path: AppPage.home.toPath,
            //   builder: (context, state) => const HomeScreen(),
            // ),
            GoRoute(
              name: AppPage.settings.toName,
              path: AppPage.settings.toPath,
              builder: (context, state) => const Settings(),
            ),
          ]),
      GoRoute(
        name: AppPage.splash.toName,
        path: AppPage.splash.toPath,
        builder: (context, state) => const Splash(),
        // redirect: conditionSplash,
      ),
      GoRoute(
        name: AppPage.login.toName,
        path: AppPage.login.toPath,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        name: AppPage.register.toName,
        path: AppPage.register.toPath,
        builder: (context, state) => const Register(),
      ),
    ],
    redirect: (context, state) {
      final initialized = appState.initialized;

      if (initialized) return AppPage.splash.toPath;
      return null;
    },
  );
}
