import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key, this.backgroundColor});

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: SizedBox(width: 350, height: 200),
    );
  }
}
