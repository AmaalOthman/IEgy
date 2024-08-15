import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/features/home/data/repos/home_repo.dart';
import 'package:iegy/features/home/presentation/cubit/sliders_cubit/sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  final HomeRepo _homeRepo;
  SlidersCubit(this._homeRepo) : super(SlidersInitial());
  static SlidersCubit get(context) => BlocProvider.of(context);

  Future<void> fetchSliders(BuildContext context) async {
    emit(SlidersLoadingState());
      final response = await _homeRepo.fetchSliders(context);
      response.fold((failure) {
        emit(SlidersErrorState(failure));
      }, (sliders) async {
        log(sliders.toString(), name: 'Sliders Response');
        emit(SlidersSuccessState(sliders));
      });
  }
}
