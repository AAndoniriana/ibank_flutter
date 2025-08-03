part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  const SignInState({this.isPasswordDisplayed = false});

  final bool isPasswordDisplayed;

  SignInState copyWith({bool? isPasswordDisplayed}) {
    return SignInState(
      isPasswordDisplayed: isPasswordDisplayed ?? this.isPasswordDisplayed,
    );
  }

  @override
  List<Object?> get props => [isPasswordDisplayed];
}
