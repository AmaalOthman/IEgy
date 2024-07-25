import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/core/routes/app_routes.dart';
import 'package:iegy/core/functions/common_methods.dart';
import 'package:iegy/features/home/presentation/cubit/order_tracking_cubit/order_tracking_state.dart';

class OrderTrackingCubit extends Cubit<OrderTrackingState> {
  OrderTrackingCubit() : super(OrderTrackingInitial());

  void onBackPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void makeAPayment(BuildContext context) {
    navigate(context: context, route: Routes.paymentScreen);
  }
}
