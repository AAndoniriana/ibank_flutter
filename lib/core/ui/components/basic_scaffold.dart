import 'package:flutter/material.dart';
import 'package:ibank/core/ui/design_system/ibank_app_bar.dart';
import 'package:ibank/core/ui/ui_util.dart';

class BasicScaffold extends StatelessWidget {
  const BasicScaffold({
    super.key,
    required this.body,
    required this.title,
    this.bottomSheet,
  });

  final Widget body;
  final String title;
  final Widget? bottomSheet;

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
        onBackPressed: backFunction(context),
      ),
      body: body,
      bottomSheet: bottomSheet,
    );
  }
}
