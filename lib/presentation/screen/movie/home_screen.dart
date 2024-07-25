import 'package:cinemapedia_flutter/config/enviroment/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final movies = ref.
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text(
            'Welcome to Cinemapedia Mobile App in Enviroment ${Enviroment.env}, running in port ${Enviroment.port} and ${Enviroment.theMovieDBKey}'),
      ),
    );
  }
}
