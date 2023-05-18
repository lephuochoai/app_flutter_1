import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/auth.dart';
import 'package:flutter_application_1/models/index.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'utils/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthState>(
              create: (_) => AuthState(), lazy: false),
          ChangeNotifierProvider<AppState>(
              create: (_) => AppState(), lazy: false),
        ],
        child: Builder(builder: (context) {
          final appState = context.watch<AppState>();
          final authState = context.watch<AuthState>();
          final AppRouter appRouter =
              AppRouter(appState: appState, authState: authState);

          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
              textTheme: const TextTheme(
                  // titleMedium: TextStyle(color: Colors.blue),
                  // bodyMedium: TextStyle(color: Colors.blue),
                  ),
            ),
            routerConfig: appRouter.goRouter,
            // routeInformationParser: goRouter.routeInformationParser,
            // routerDelegate: goRouter.routerDelegate,
          );
        }));
  }
}
