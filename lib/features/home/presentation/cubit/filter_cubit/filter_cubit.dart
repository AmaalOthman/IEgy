import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/core/functions/common_methods.dart';
import 'package:iegy/features/home/presentation/cubit/filter_cubit/filter_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());
  RangeValues priceRanges = const RangeValues(3000, 7000);
  List<bool> categorySelection = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<bool> colorSelection = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  void onXPressed(BuildContext context) {
    reset();
    Navigator.pop(context);
  }

  void onSliderChanges(RangeValues newRange) {
    priceRanges = newRange;
    emit(RangeChangeState());
  }

  void onCategoryPressed(int index) {
    for (int i = 0; i < categorySelection.length; i++)
      categorySelection[i] = false;
    categorySelection[index] = true;
    emit(SelectCategoryState());
  }

  void onColorPressed(int index) {
    for (int i = 0; i < colorSelection.length; i++) colorSelection[i] = false;
    colorSelection[index] = true;
    emit(SelectColorState());
  }

  void applyFiltration(BuildContext context) {
    showToast(
        message: AppLocalizations.of(context)!.filtration_applied,
        state: ToastStates.success);
    Navigator.pop(context);
  }

  void reset() {
    priceRanges = const RangeValues(3000, 7000);
    for (int i = 0; i < categorySelection.length; i++)
      categorySelection[i] = false;
    categorySelection[0] = true;
    for (int i = 0; i < colorSelection.length; i++) colorSelection[i] = false;
    colorSelection[0] = true;
    emit(FilterInitial());
  }
}
