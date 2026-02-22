import 'package:cinemapedia_flutter/presentation/screen/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class InitialScreen extends ConsumerWidget {
  static const String name = 'initial_screen';
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(sharedPreferencesProvider.future);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Initial Screen'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              prefs.then((data) {
                data.setBool('isFirstTime', false);
                print('Paso por INITIAL SCREEN: ${data.getBool('isFirstTime')}');
              });
              context.go('/');
            },
            child: const Text('Go to Home')),
      ),
    );
  }
}
