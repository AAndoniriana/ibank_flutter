import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(super.initialState) {
    on<SignInTogglePassword>(_onTogglePassword);
  }

  void _onTogglePassword(
    SignInTogglePassword event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(isPasswordDisplayed: !state.isPasswordDisplayed));
  }
}
