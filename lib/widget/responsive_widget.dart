import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const ResponsiveWidget({
    super.key,
    required this.child,
    this.maxWidth = 800, // Default max width for larger screens
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // If screen is wider than maxWidth, constrain it
    if (screenWidth >= maxWidth) {
      return Center(child: SizedBox(width: maxWidth, child: child));
    }

    // Else return child without constraint
    return child;
  }
}
