import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/utils/common_methods.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_text_form_field.dart';
import 'package:iegy/features/cart/presentation/components/basket_item.dart';
import 'package:iegy/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:iegy/features/cart/presentation/cubit/cart_cubit/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 84.h),
            child: Column(
              children: [
                const Spacer(),
                AppBar(
                  title: Text(
                    AppLocalizations.of(context)!.my_cart,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  leading: BackArrow(onTap: () => BlocProvider.of<CartCubit>(context)
                      .onBackPressed(context))
                )
              ]
            )
          ),
          body: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Column(children: [
                Expanded(
                    child: ListView(
                  children: [
                    BaskedItem(
                      imageUrl:
                          'https://ro2yahome.com/wp-content/uploads/2022/07/black-1.jpg',
                      title: AppLocalizations.of(context)!.modern_chair,
                      price: 1500,
                      oldPrice: 5000,
                      num: 1,
                    ),
                    BaskedItem(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7hh_4qNR41XEV46NfeiEablFeVkTO32uOiA&usqp=CAU',
                      title: AppLocalizations.of(context)!.modern_chair,
                      price: 3000,
                      oldPrice: 5000,
                      num: 1,
                    )
                  ],
                )),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(children: [
                      CustomTextFormField(
                        hint: AppLocalizations.of(context)!
                            .enter_discount_promo_code,
                        suffixIcon: isArabic()
                            ? CustomImage(
                                imagePath: AppAssets.send, w: 17.9.w, h: 18.h)
                            : Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(0, 0, -1),
                                alignment: Alignment.center,
                                child: CustomImage(
                                    imagePath: AppAssets.send,
                                    w: 17.9.w,
                                    h: 18.h)),
                      ),
                      SizedBox(height: 30.h),
                      Row(children: [
                        Text(AppLocalizations.of(context)!.total,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: AppColors.darkBlue)),
                        const Spacer(),
                        Text('4500 ${AppLocalizations.of(context)!.egp}',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: AppColors.brown))
                      ])
                    ])),
                SizedBox(height: 40.h),
                CustomButton(
                    onPressed: () =>
                        BlocProvider.of<CartCubit>(context).pay(context),
                    text: AppLocalizations.of(context)!.pay)
              ])));
    });
  }
}
