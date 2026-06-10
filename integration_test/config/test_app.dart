import 'package:cinemapedia_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget buildTestApp({List overrides = const []}) {
  return ProviderScope(overrides: overrides as dynamic, child: const MainApp());
}
