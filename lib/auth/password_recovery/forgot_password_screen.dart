import 'package:flutter/material.dart';
import 'package:ibank/auth/password_recovery/components/screen_card.dart';
import 'package:ibank/auth/password_recovery/password_changed_screen.dart';
import 'package:ibank/core/ui/components/basic_scaffold.dart';
import 'package:ibank/core/ui/design_system/ibank_button.dart';
import 'package:ibank/core/ui/design_system/ibank_input.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  PasswordStep currentStep = PasswordStep.phoneNumber;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (currentStep) {
      case PasswordStep.phoneNumber:
        content = _EnterPhoneNumberStep(
          () => setState(() {
            currentStep = PasswordStep.code;
          }),
        );
        break;
      case PasswordStep.code:
        content = _EnterCodeStep(
          () => setState(() {
            currentStep = PasswordStep.resetPassword;
          }),
        );
        break;
      case PasswordStep.resetPassword:
        content = _ChangePasswordStep();
        break;
    }
    return BasicScaffold(
      title: 'Forgot your password',
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: content,
      ),
    );
  }
}

class _EnterPhoneNumberStep extends StatelessWidget {
  const _EnterPhoneNumberStep(this.onStepCompleted);

  final void Function() onStepCompleted;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: ScreenCard(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12.0,
            children: [
              Text(
                'Type your phone number',
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant.withAlpha(140),
                ),
              ),
              IBankInput(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixText: '(+84)',
                  prefixStyle: textTheme.labelMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'We texted you a code to verify your phone number',
                  style: textTheme.bodyMedium,
                ),
              ),
              IBankButton(text: 'Send', onPressed: onStepCompleted),
            ],
          ),
        ),
      ),
    );
  }
}

class _EnterCodeStep extends StatelessWidget {
  const _EnterCodeStep(this.onStepCompleted);

  final void Function() onStepCompleted;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ScreenCard(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12.0,
                  children: [
                    Text(
                      'Type a code',
                      style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant.withAlpha(140),
                      ),
                    ),
                    Row(
                      spacing: 12.0,
                      children: [
                        Flexible(
                          flex: 2,
                          child: IBankInput(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(hintText: 'Code'),
                          ),
                        ),
                        Flexible(
                          child: IBankButton(text: 'Resend', onPressed: () {}),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'We texted you a code to verify your phone number ',
                            style: textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text: '(+84) 0398829xxx',
                            style: textTheme.bodyLarge?.copyWith(
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    RichText(
                      text: TextSpan(
                        text:
                            'This code will expired 10 minutes after this message. If you don\'t get a message.',
                        style: textTheme.bodyLarge,
                      ),
                    ),
                    IBankButton(
                      text: 'Change password',
                      onPressed: onStepCompleted,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Flexible(
            child: Text(
              'Change your phone number',
              style: textTheme.labelLarge?.copyWith(color: colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChangePasswordStep extends StatelessWidget {
  const _ChangePasswordStep();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ScreenCard(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12.0,
                  children: [
                    Text(
                      'Type your new password',
                      style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant.withAlpha(140),
                      ),
                    ),
                    IBankInput(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.visibility),
                      ),
                    ),
                    Text(
                      'Confirm your new password',
                      style: textTheme.labelLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant.withAlpha(140),
                      ),
                    ),
                    IBankInput(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.visibility),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    IBankButton(
                      text: 'Change password',
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const PasswordChangedScreen(),
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
        ],
      ),
    );
  }
}

enum PasswordStep { phoneNumber, code, resetPassword }
