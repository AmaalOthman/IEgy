import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/features/home/data/repos/home_repo.dart';
import 'package:iegy/features/home/presentation/cubit/offers_cubit/offers_state.dart';
class OffersCubit extends Cubit<OffersState> {
  OffersCubit(this._homeRepo) : super(OffersInitial());
  final HomeRepo _homeRepo;
  static OffersCubit get(context) => BlocProvider.of(context);

  Future<void> fetchSliders(BuildContext context) async {
    emit(OffersLoadingState());
    final response = await _homeRepo.fetchOffers(context);
    response.fold((failure) {
      emit(OffersErrorState(failure));
    }, (offers) async {
      log(offers.toString(), name: 'offers Response');
      emit(OffersSuccessState(offers));
    });
  }
}
