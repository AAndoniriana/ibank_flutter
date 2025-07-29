import 'package:flutter/material.dart';
import 'package:ibank/auth/sign_in/sign_in_screen.dart';
import 'package:ibank/core/ui/design_system/ibank_button.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16.0,
              children: [
                Image.asset(
                  'assets/images/phone_shield.png',
                  fit: BoxFit.cover,
                ),
                Text(
                  'Change password successfully!',
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text:
                        'You have successfully change password.\nPlease use the new password when Sign in.',
                    style: textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 12.0),
                IBankButton(
                  text: 'OK',
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                      (_) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
