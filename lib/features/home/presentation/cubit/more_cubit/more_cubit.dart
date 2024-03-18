import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/features/home/presentation/cubit/more_cubit/more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(MoreInitial());
  String section = '';
  int currentPage = 1;

  void onBackPressed(BuildContext context) {
    if(currentPage > 1) {
      currentPage --;
      emit(ChangePageState());
    } else {
      Navigator.pop(context);
    }
  }

  void goNext() {
    if (currentPage < 4) {
      currentPage ++;
      emit(ChangePageState());
    }
  }
}