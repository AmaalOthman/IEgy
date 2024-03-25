import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/features/home/presentation/cubit/order_tracking_cubit/order_tracking_state.dart';

class OrderTrackingCubit extends Cubit<OrderTrackingState> {
  OrderTrackingCubit() : super(OrderTrackingInitial());

  void onBackPressed(BuildContext context) {
    Navigator.pop(context);
  }
}
