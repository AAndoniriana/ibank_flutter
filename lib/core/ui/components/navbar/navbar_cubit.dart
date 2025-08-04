import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<int> {
  NavbarCubit() : super(NavigationBarState().selectedIndex);

  void changeIndex(int index) {
    NavigationBarState().selectedIndex = index;
    emit(index);
  }
}
