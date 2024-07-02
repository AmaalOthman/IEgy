import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/features/home/presentation/cubit/supply_and_installation_cubit/supply_and_installation_state.dart';

class SupplyAndInstallationCubit extends Cubit<SupplyAndInstallationState> {
  SupplyAndInstallationCubit() : super(SupplyAndInstallationInitial());
  bool regionsShown = false;

  void showOrHideRegions() {
    if(regionsShown == false) {
      regionsShown = true;
      emit(ShowRegionsState());
    } else {
      regionsShown = false;
      emit(SupplyAndInstallationInitial());
    }
  }
}
