import 'package:flutter/material.dart';

import 'package:cinemapedia_flutter/config/router/app_router.dart';
import 'package:cinemapedia_flutter/config/config/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Cinemapedia Mobile App',
      routerConfig: appRouter,
      theme: AppTheme( selectedColor: 0, isDarkMode: false).getTheme(),
    );
  }
}
