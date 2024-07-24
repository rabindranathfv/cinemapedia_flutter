import 'package:cinemapedia_flutter/config/enviroment/enviroment.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
