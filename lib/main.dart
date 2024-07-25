import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:cinemapedia_flutter/config/router/app_router.dart';
import 'package:cinemapedia_flutter/config/config/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env', mergeWith: {
    'ENV': 'dev',
  });
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Cinemapedia Mobile App',
      routerConfig: appRouter,
      theme: AppTheme(selectedColor: 0, isDarkMode: false).getTheme(),
    );
  }
}
