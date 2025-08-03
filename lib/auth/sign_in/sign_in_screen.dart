import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibank/auth/password_recovery/forgot_password_screen.dart';
import 'package:ibank/auth/sign_in/sign_in_bloc.dart';
import 'package:ibank/auth/sign_up/sign_up_screen.dart';
import 'package:ibank/core/ui/design_system/ibank_app_bar.dart';
import 'package:ibank/core/ui/design_system/ibank_button.dart';
import 'package:ibank/core/ui/design_system/ibank_input.dart';
import 'package:ibank/core/ui/ui_util.dart';
import 'package:ibank/home/home_screen.dart';

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
        onBackPressed: backFunction(context),
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
          color: colorScheme.surfaceContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
          child: SingleChildScrollView(
            child: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return Column(
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
                      obscureText: !state.isPasswordDisplayed,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            context.read<SignInBloc>().add(
                              SignInTogglePassword(),
                            );
                          },
                          child: Icon(
                            state.isPasswordDisplayed
                                ? Icons.visibility_off
                                : Icons.visibility,
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
                    IBankButton(
                      text: 'Sign in',
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (_) => false,
                        );
                      },
                    ),
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
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const SignUpScreen();
                                    },
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
