import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/features/home/data/repos/home_repo.dart';
import 'package:iegy/features/home/presentation/cubit/best_seller_cubit/best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  BestSellerCubit(this._homeRepo) : super(BestSellerInitial());
  final HomeRepo _homeRepo;
  static BestSellerCubit get(context) => BlocProvider.of(context);

  Future<void> fetchBestSeller(BuildContext context) async {
    emit(BestSellerLoadingState());
    final response = await _homeRepo.fetchBestSeller(context);
    response.fold((failure) {
      emit(BestSellerErrorState(failure));
    }, (offers) async {
      log(offers.toString(), name: 'Best Seller Response');
      emit(BestSellerSuccessState(offers));
    });
  }
}
