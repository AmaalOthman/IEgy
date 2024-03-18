import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/features/cart/presentation/cubit/payment_cubit/payment_state.dart';
import 'package:iegy/features/cart/presentation/screens/buyer_data_screen.dart';
import 'package:iegy/features/cart/presentation/screens/payment_data_screen.dart';
import 'package:iegy/features/cart/presentation/screens/product_data_screen.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  final List<Widget> phases = [
    const BuyerDataScreen(),
    const ProductDataScreen(),
    const PaymentDataScreen()
  ];
  int currentPhase = 0;

  void onBackPressed(BuildContext context) {
    if (currentPhase == 0) {
      Navigator.pop(context);
    } else {
      currentPhase --;
      emit(MoveAPhaseState());
    }
  }

  void goNext() {
    currentPhase < 2? currentPhase ++: null;
    emit(MoveAPhaseState());
  }
}