import '../../models/azkar_tsabeeh.dart';

abstract class AzkarStates {
    AzkarAndTsabeeh azkarAndTsabeeh ;

   AzkarStates({AzkarAndTsabeeh? azkarAndTsabeeh }  )
       :azkarAndTsabeeh = azkarAndTsabeeh ?? AzkarAndTsabeeh(); // optional parameter with default value ""

 }

class InitialAzkarStates extends AzkarStates {
  InitialAzkarStates();
}


class ListAzkarStates extends AzkarStates {
   AzkarAndTsabeeh azkarAndTsabeehList ;
  ListAzkarStates({required this.azkarAndTsabeehList}): super(azkarAndTsabeeh: azkarAndTsabeehList);
}
class IncrementAzkarTimesAppState extends AzkarStates {
  IncrementAzkarTimesAppState();
}
class ClearTimesAppState extends AzkarStates {
  ClearTimesAppState();
}
