import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest('patrol smoke test boots app', ($) async {
    await $.pumpWidgetAndSettle(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('app'),
          ),
        ),
      ),
    );

    expect($('app').exists, true);
  });
}
