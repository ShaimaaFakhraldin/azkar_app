 import 'package:azkar_app/them/bloc/them_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemBloc  extends Bloc <ThemEvent, ThemeData>{
  var _darkTheme = true;

  ThemBloc():super ( lightThem){
    on<ChangThemLight>((event, emit) {
      emit(state.brightness ==  Brightness.light ? darkThem : lightThem);
    });

  }

  static final lightThem = ThemeData(
    brightness: Brightness.light
  );

  static final darkThem = ThemeData(
      brightness: Brightness.dark
  );
}