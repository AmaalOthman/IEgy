import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/features/profile/presentation/components/order.dart';
import 'package:iegy/features/profile/presentation/cubit/orders_cubit/orders_cubit.dart';
import 'package:iegy/features/profile/presentation/cubit/orders_cubit/orders_state.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 84.h),
            child: Column(
              children: [
                const Spacer(),
                AppBar(
                  title: Text(
                    AppLocalizations.of(context)!.orders,
                    style: Theme
                        .of(context)
                        .textTheme
                        .displayLarge,
                  ),
                  leading: const BackArrow()
                )
              ]
            )
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100.w,
                  height: 56.h,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField2<String>(
                      iconStyleData: const IconStyleData(iconDisabledColor: AppColors.darkBrown, iconEnabledColor: AppColors.darkBrown),
                      isExpanded: false,
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 10.w, color: AppColors.darkBrown),
                    contentPadding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 4.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                      hint: Text(
                        BlocProvider.of<OrdersCubit>(context).selectedPeriod,
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 10.w, color: AppColors.darkBrown),
                      ),
                      items: BlocProvider.of<OrdersCubit>(context).items
                          .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 10.w, color: AppColors.darkBrown),
                        ),
                      ))
                          .toList(),
                      value: BlocProvider.of<OrdersCubit>(context).selectedValue,
                      onChanged: (value) => BlocProvider.of<OrdersCubit>(context).onPeriodChanged(value),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(12),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        height: 20.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h,),
                const Order(),
                const Order(),
                const Order()
              ],
            ),
          ),
        );
      },
    );
  }
}