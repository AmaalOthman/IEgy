import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/core/routes/app_routes.dart';
import 'package:iegy/core/utils/common_methods.dart';
import 'package:iegy/features/cart/presentation/cubit/cart_cubit/cart_state.dart';
import 'package:iegy/features/nav_bar/presentation/cubit/nav_bar_cubit.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  void onBackPressed(BuildContext context) {
    BlocProvider.of<NavBarCubit>(context).changeIndex(0);
    BlocProvider.of<NavBarCubit>(context).controller.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void pay(BuildContext context) {
    navigate(context: context, route: Routes.paymentScreen);
  }
}
