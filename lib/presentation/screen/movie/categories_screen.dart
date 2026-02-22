import 'package:cinemapedia_flutter/presentation/screen/providers/shared_preferences/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends ConsumerWidget {
  static const String name = 'categories_screen';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(sharedPreferencesProvider.future);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories Screen'),
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: ElevatedButton(
                onPressed: () async {
                  // reset state preferences
                  prefs.then((data) {
                    data.setBool('isFirstTime', true);
                    print('PREFS RESET: ${data.getBool('isFirstTime')}');
                  });
                },
                child: const Text('RESET PREFERENCES'),
              ),
    );
  }
}
