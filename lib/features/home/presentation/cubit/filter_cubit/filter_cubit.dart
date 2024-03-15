import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/features/home/presentation/cubit/filter_cubit/filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());
  void onXPressed(BuildContext context) {
    Navigator.pop(context);
  }
}
