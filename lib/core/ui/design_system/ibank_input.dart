import 'package:flutter/material.dart';

class IBankInput extends StatelessWidget {
  const IBankInput({
    super.key,
    this.decoration = const InputDecoration(),
    this.controller,
    this.enabled,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.obscureText = false,
  });

  final InputDecoration decoration;
  final TextEditingController? controller;
  final bool? enabled;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    );
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: decoration.copyWith(
        border: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colorScheme.outline),
        ),
      ),
      keyboardType: keyboardType,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      enabled: enabled,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
