import 'package:flutter/material.dart';
import 'package:ibank/core/ui/design_system/ibank_app_bar.dart';

class BasicScaffold extends StatelessWidget {
  const BasicScaffold({super.key, required this.body, required this.title});

  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: IBankAppBar.withBackButton(
        content: Text(
          title,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        iconColor: colorScheme.onSurface,
        onBackPressed: getBackPressedFunction(context),
      ),
      body: body,
    );
  }

  void Function()? getBackPressedFunction(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      return () {
        Navigator.of(context).pop();
      };
    }
    return null;
  }
}
