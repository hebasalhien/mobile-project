import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark);

  void toggleTheme(bool isLight) {
    emit(isLight ? ThemeMode.light : ThemeMode.dark);
  }
}
