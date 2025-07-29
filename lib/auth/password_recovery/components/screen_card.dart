import 'package:flutter/material.dart';

class ScreenCard extends StatelessWidget {
  const ScreenCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 16.0,
      shadowColor: colorScheme.shadow.withAlpha(80),
      color: colorScheme.surfaceContainerLowest,
      child: child,
    );
  }
}
