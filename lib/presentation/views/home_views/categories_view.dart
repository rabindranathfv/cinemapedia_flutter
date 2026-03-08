import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CategoriesView extends ConsumerWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories Screen'),
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: const Center(child: Text('Categories View')),
    );
  }
}
