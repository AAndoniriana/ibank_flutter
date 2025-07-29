import 'package:flutter/material.dart';
import 'package:ibank/auth/sign_in/sign_in_screen.dart';
import 'package:ibank/core/ui/theme.dart';
import 'package:ibank/core/ui/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    const Color primaryColor = Color(0xFF3629B7);
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);
    var lightColorScheme = theme.light().colorScheme.copyWith(
      primary: primaryColor,
    );
    var darkColorScheme = theme.dark().colorScheme.copyWith(
      primary: primaryColor,
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: brightness == Brightness.light
          ? theme.light().copyWith(colorScheme: lightColorScheme)
          : theme.dark().copyWith(colorScheme: darkColorScheme),
      home: const SignInScreen(),
    );
  }
}
