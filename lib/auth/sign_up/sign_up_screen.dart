import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ibank/auth/home/home_screen.dart';
import 'package:ibank/auth/sign_in/sign_in_screen.dart';
import 'package:ibank/core/ui/design_system/ibank_app_bar.dart';
import 'package:ibank/core/ui/design_system/ibank_button.dart';
import 'package:ibank/core/ui/design_system/ibank_checkbox.dart';
import 'package:ibank/core/ui/design_system/ibank_input.dart';
import 'package:ibank/core/ui/ui_util.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.primary,
      appBar: IBankAppBar.withBackButton(
        iconColor: Colors.white,
        onBackPressed: backFunction(context),
        content: Text(
          'Sign up',
          style: textTheme.titleMedium?.copyWith(
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
          color: colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Welcome to us',
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.primary,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '\nHello there, create a new account',
                          style: textTheme.bodySmall?.copyWith(
                            fontSize: 12.0,
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset('assets/images/phone.png', fit: BoxFit.cover),
                const IBankInput(
                  decoration: InputDecoration(hintText: 'Name'),
                  keyboardType: TextInputType.emailAddress,
                ),
                IBankInput(
                  decoration: InputDecoration(
                    hintText: 'Phone number',
                    prefixText: '(+84)',
                    prefixStyle: textTheme.labelMedium,
                  ),
                  keyboardType: TextInputType.phone,
                ),
                IBankInput(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.visibility,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    spacing: 8,
                    children: [
                      IBankCheckbox(value: false, onChanged: (value) {}),
                      Flexible(
                        child: RichText(
                          maxLines: 2,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'By creating an account your agree to our ',
                                style: textTheme.labelMedium,
                              ),
                              TextSpan(
                                text: 'Term and Conditions',
                                style: textTheme.labelMedium?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IBankButton(
                  text: 'Sign up',
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (_) => false,
                    );
                  },
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Have an account? ',
                        style: textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: ' Sign Up',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SignInScreen();
                                },
                              ),
                            );
                          },
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
}
