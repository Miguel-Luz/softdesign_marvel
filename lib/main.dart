import 'package:flutter/material.dart';
import 'package:softdesign_marvel/src/router.dart';
import 'package:softdesign_marvel/src/service_locator.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: _buildTheme(),
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    textTheme: _buildShrineTextTheme(base.textTheme),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    bodyMedium: base.bodyLarge!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 14.0,
      color: Colors.white,
    ),
  );
}
