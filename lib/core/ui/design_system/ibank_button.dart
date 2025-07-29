import 'package:flutter/material.dart';

class IBankButton extends StatelessWidget {
  const IBankButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  final String text;
  final void Function() onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: enabled
              ? colorScheme.primary
              : const Color(0xFFF2F1F9),
          padding: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),

        onPressed: enabled ? onPressed : null,
        child: Text(
          text,
          style: theme.textTheme.labelLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
