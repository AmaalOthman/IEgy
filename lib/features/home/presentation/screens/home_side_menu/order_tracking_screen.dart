import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/custom_cached_image.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/line.dart';
import 'package:iegy/features/home/presentation/components/order_status_card.dart';
import 'package:iegy/features/home/presentation/cubit/order_tracking_cubit/order_tracking_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/order_tracking_cubit/order_tracking_state.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderTrackingCubit, OrderTrackingState>(
        builder: (context, state) {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 84.h),
            child: Column(
              children: [
                const Spacer(),
                AppBar(
                  title: Text(
                    AppLocalizations.of(context)!.order_tracking,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  leading: IconButton(
                    onPressed: () =>
                        BlocProvider.of<OrderTrackingCubit>(context)
                            .onBackPressed(context),
                    icon: const BackArrow(),
                  ),
                ),
              ],
            ),
          ),
          body: Column(children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderStatusCard(
                        title: AppLocalizations.of(context)!.awaiting_payment,
                        details:
                            '${AppLocalizations.of(context)!.make_the_payment_by} 19 - 12 - 2023',
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      CustomImage(
                        imagePath: AppAssets.paymentOrderStatus,
                        h: 48.h,
                        w: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(AppLocalizations.of(context)!.shipping_info,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontSize: 20.h, color: AppColors.brown)),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(AppLocalizations.of(context)!.order_reserved,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 14.h, color: AppColors.darkBlue)),
                      Text(
                          '19-12-2023 4:00 ${AppLocalizations.of(context)!.pm}',
                          style: Theme.of(context).textTheme.displaySmall),
                      SizedBox(height: 24.h),
                      const Line(),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Text(AppLocalizations.of(context)!.shipping_address,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      fontSize: 20.h, color: AppColors.brown)),
                          const Spacer(),
                          Text(AppLocalizations.of(context)!.edit,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      decoration: TextDecoration.underline))
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Text('${AppLocalizations.of(context)!.name}: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      color: AppColors.darkBlue,
                                      fontSize: 16.h)),
                          Text('أحمد محمد',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      color: AppColors.darkBlue,
                                      fontSize: 16.h))
                        ],
                      ),
                      Row(
                        children: [
                          Text('${AppLocalizations.of(context)!.house}: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      color: AppColors.darkBlue,
                                      fontSize: 16.h)),
                          Text('المهندسين شارع جامعة الدول العربية',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      color: AppColors.darkBlue,
                                      fontSize: 16.h))
                        ],
                      ),
                      Row(
                        children: [
                          Text('${AppLocalizations.of(context)!.phone}: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      color: AppColors.darkBlue,
                                      fontSize: 16.h)),
                          Text('01123456789',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      color: AppColors.darkBlue,
                                      fontSize: 16.h))
                        ],
                      ),
                      SizedBox(height: 16.h),
                      const Line(),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          CustomCachedImage(
                              radius: 8,
                              h: 56.h,
                              w: 56.w,
                              imgUrl:
                                  'https://chichomz.com/cdn/shop/products/wod1025-b_1200x1200.jpg?v=1672576403'),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context)!.sofra,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                          color: AppColors.darkBlue,
                                          fontSize: 16.h)),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text('7000 ${AppLocalizations.of(context)!.egp}')
                            ],
                          ),
                          const Spacer(),
                          Text(AppLocalizations.of(context)!.edit,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      decoration: TextDecoration.underline))
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(children: [
                        CustomCachedImage(
                            radius: 8,
                            h: 56.h,
                            w: 56.w,
                            imgUrl:
                                'https://coastwoodfurniture.co.nz/cdn/shop/articles/15_project_dark_render1_1_1024x.jpg?v=1658088055'),
                        SizedBox(
                          width: 12.w,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context)!.bedroom,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                          color: AppColors.darkBlue,
                                          fontSize: 16.h)),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text('12000 ${AppLocalizations.of(context)!.egp}')
                            ])
                      ]),
                      SizedBox(
                        height: 12.h,
                      ),
                      const Line(),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(children: [
                        Text(AppLocalizations.of(context)!.total_amount,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontSize: 20.h, color: AppColors.brown)),
                        const Spacer(),
                        Text('19000 ${AppLocalizations.of(context)!.egp}',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: AppColors.darkBlue))
                      ])
                    ])),
            const Spacer(),
            Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)),
                    color: AppColors.white),
                height: 90.h,
                width: double.infinity,
                padding: EdgeInsets.all(16.h),
                child: CustomButton(
                    onPressed: () {}, text: AppLocalizations.of(context)!.pay))
          ]));
    });
  }
}