import 'dart:ui';

import 'package:flutter/material.dart';

class CustomScrollConfig extends StatelessWidget {
  final Widget child;
  const CustomScrollConfig({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: true,
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,

          PointerDeviceKind.trackpad,
          PointerDeviceKind.invertedStylus,
          PointerDeviceKind.unknown,
        },
      ),
      child: child,
    );
  }
}
