import 'package:flutter/material.dart';
import 'package:ibank/core/ui/components/basic_scaffold.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return BasicScaffold(
      title: 'Forgot your password',
      body: SingleChildScrollView(child: Column(children: [])),
    );
  }
}
