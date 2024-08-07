import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/core/routes/app_routes.dart';
import 'package:iegy/core/functions/common_methods.dart';
import 'package:iegy/features/profile/presentation/cubit/orders_cubit/orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  String selectedPeriod = isArabic() ? 'آخر ثلاثة أشهر' : 'Last three months';
  final List<String> items = isArabic()
      ? ['آخر ثلاثة أشهر', 'آخر ستة أشهر', 'آخر سنة']
      : ['Last three months', 'Last six months', 'Last year'];
  String? selectedValue;

  void onPeriodChanged(value) {
    selectedValue = value;
    emit(ChangePeriodState());
  }

  void onOrderClicked(BuildContext context) {
    navigate(context: context, route: Routes.orderDetailsScreen);
  }
}
