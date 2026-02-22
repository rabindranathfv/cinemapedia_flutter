import 'package:cinemapedia_flutter/presentation/screen/background_detector.dart';
import 'package:cinemapedia_flutter/presentation/screen/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:cinemapedia_flutter/config/router/app_router.dart';
import 'package:cinemapedia_flutter/config/config/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env', mergeWith: {
    'ENV': 'dev',
  });
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(
    child: BackgroundDetector(child: MainApp()),
  ));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final container = ProviderScope.containerOf(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Cinemapedia Mobile App',
      routerConfig: createAppRouter(container),
      theme: AppTheme(selectedColor: 0, isDarkMode: false).getTheme(),
    );
  }
}
