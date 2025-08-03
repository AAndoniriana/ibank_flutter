part of 'sign_in_bloc.dart';

sealed class SignInEvent {
  const SignInEvent();
}

final class SingInButtonPressed extends SignInEvent {}

final class SignInSignUpPressed extends SignInEvent {}

final class SignInPasswordForgottenPressed extends SignInEvent {}

final class SignInTogglePassword extends SignInEvent {}
