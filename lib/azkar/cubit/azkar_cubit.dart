import 'dart:convert';

import 'package:azkar_app/shard/constants.dart';
import 'package:azkar_app/models/azkar_tsabeeh.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarStates> {
  late AzkarAndTsabeeh _azkarAndTsabeeh;

  List<String> _azkarList = [];
  List<int> azkarTimes = [];

  AzkarCubit() : super(InitialAzkarStates());

  loadAzkarAndTsabeeh() {
    Map<String, dynamic> json1 = jsonDecode(azkar);
    azkarTimes = List.filled(azkar.length, 0);

    AzkarAndTsabeeh azkarAndTsabeeh = AzkarAndTsabeeh.fromJson(json1);
    _azkarAndTsabeeh = azkarAndTsabeeh;
    emit(ListAzkarStates(azkarAndTsabeehList: azkarAndTsabeeh));
  }

  List<String> loadAzharListOfCategory(int index) {
    switch (index) {
      case 0:
        _azkarList = AzkarAndTsabeeh.azkarElSabah;
        break;
      case 1:
        _azkarList = AzkarAndTsabeeh.azkarElMasa2;

        break;
      case 2:
        _azkarList = AzkarAndTsabeeh.azkarElNoom;

        break;
      case 3:
        _azkarList = AzkarAndTsabeeh.tsabee7;


        break;
      case 4:
        _azkarList = AzkarAndTsabeeh.ad3ya;
        break;
    }

    return _azkarList;
  }

  void incrementAzkarTimes(index) {
    azkarTimes[index]++;
    print(azkarTimes);
    emit(IncrementAzkarTimesAppState());
  }

  void clearTimes(index) {
    azkarTimes[index] = 0;
    emit(ClearTimesAppState());
  }
   int total (){
     return   azkarTimes.reduce((a, b) => a + b);

   }

}
