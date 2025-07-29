import 'package:flutter/material.dart';

class IBankIconCard extends StatelessWidget {
  const IBankIconCard({
    super.key,
    required this.icon,
    required this.text,
    this.isEnabled = true,
  });

  final bool isEnabled;
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return SizedBox(
      width: 148.0,
      child: Card(
        color: isEnabled ? colorScheme.primary : const Color(0xFFE0E0E0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 8.0,
            children: <Widget>[
              icon,
              Text(
                text,
                maxLines: 2,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
