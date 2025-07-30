import 'package:flutter/material.dart';

class IBankCheckbox extends StatelessWidget {
  const IBankCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.scale = 1.5,
    this.tristate = false,
  });

  final bool? value;
  final void Function(bool?) onChanged;
  final double scale;
  final bool tristate;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return Transform.scale(
      scale: scale,
      child: Checkbox(
        tristate: tristate,
        value: value,
        onChanged: onChanged,
        checkColor: colorScheme.primary,
        fillColor: WidgetStateProperty.resolveWith((widgetState) {
          return colorScheme.surface;
        }),
        side: WidgetStateBorderSide.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return BorderSide(color: colorScheme.primary, width: 2.0);
          }
          return BorderSide(color: colorScheme.outline, width: 2.0);
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(4.0),
        ),
      ),
    );
  }
}
