import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemCubit extends Cubit<ThemeData>{

  ThemCubit() :super(lightThem);


  void toggleThem (){
      emit(state.brightness == Brightness.light ?darkThem :lightThem);
  }


  static final lightThem = ThemeData(
      brightness: Brightness.light ,

  );

  static final darkThem = ThemeData(
      brightness: Brightness.dark
  );

}