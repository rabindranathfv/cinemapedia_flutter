import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundDetector extends StatefulWidget {
  const BackgroundDetector({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<BackgroundDetector> createState() => _BackgroundDetectorState();
}

class _BackgroundDetectorState extends State<BackgroundDetector>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('STATE: ${state}');
    // So far, we have used two of the five entries from the AppLifecycleState enum, which represents the different states in which an application can exist. Here is a list explaining each state:

    // detached: The application is running without a visible screen at that specific moment. It is either in the process of showing something for the first time or after temporarily hiding a screen and just before it becomes visible again.
    // hidden: All views of the application are hidden.
    // inactive: The application is partially obscured by another application or a phone call came in. In this state, the application may still be visible but not receive user input.
    // paused: The application is in the background and not visible to the user. It can occur when the user switches to another application or when the device goes into sleep mode.
    // resumed: The application is in the foreground and is visible to the user. It is the active state where the user can interact with the application
    print('CICLO DE VIDAS');
    if (state == AppLifecycleState.resumed) {
      print('\x1B[34m App in foreground\x1B[0m');
    }

    if (state == AppLifecycleState.paused) {
      print('\x1B[33m App in background\x1B[0m');
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
