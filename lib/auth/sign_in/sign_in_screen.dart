import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibank/auth/password_recovery/forgot_password_screen.dart';
import 'package:ibank/core/ui/design_system/ibank_app_bar.dart';
import 'package:ibank/core/ui/design_system/ibank_button.dart';
import 'package:ibank/core/ui/design_system/ibank_input.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.primary,
      appBar: IBankAppBar.withBackButton(
        iconColor: Colors.white,
        onBackPressed: canBack(context),
        content: Text(
          'Sign in',
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 32,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome back',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: colorScheme.primary,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '\nHello there, sign in to continue',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 12.0,
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset('assets/images/lock.png', fit: BoxFit.cover),
                const IBankInput(
                  decoration: InputDecoration(hintText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                IBankInput(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.remove_red_eye_rounded,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forgot your password ?',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withAlpha(128),
                      ),
                    ),
                  ),
                ),
                IBankButton(text: 'Sign in', onPressed: () {}),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset('assets/icons/fingerprint.svg'),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: ' Sign Up',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void Function()? canBack(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      return () {
        Navigator.of(context).pop();
      };
    }
    return null;
  }
}
