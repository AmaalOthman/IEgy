import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';
import 'package:iegy/core/widgets/page_indicator.dart';
import 'package:iegy/features/cart/presentation/components/data_input_field.dart';
import 'package:iegy/features/cart/presentation/components/product_data_item.dart';
import 'package:iegy/features/cart/presentation/cubit/payment_cubit/payment_cubit.dart';
import 'package:iegy/features/cart/presentation/cubit/payment_cubit/payment_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class ProductDataScreen extends StatelessWidget {
  const ProductDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PageIndicator(selected: false),
                PageIndicator(selected: true),
                PageIndicator(selected: false),
                PageIndicator(selected: false)
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
                '${BlocProvider.of<PaymentCubit>(context).currentPhase + 1}/${BlocProvider.of<PaymentCubit>(context).phases.length}'),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    height: 131.h,
                    width: 148.w,
                    imageUrl:
                        'https://athome-eg.com/image/cache/catalog/Kitchen%20-%20KT/Kitchen-KT.55-1000x667.jpg',
                    errorWidget: (context, url, error) =>
                        const CustomImage(imagePath: AppAssets.errorImage),
                    // placeholder: (context, url) => const CustomImage(imagePath: AppAssets.placeholder),
                    progressIndicatorBuilder: (context, url, progress) =>
                        SizedBox(
                            width: 228.w,
                            child:
                                const Center(child: CustomLoadingIndicator())),
                  ),
                ),
                SizedBox(
                  width: 32.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.modern_chair,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: AppColors.black),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Text(
                            '${3000 % 10 == 0 ? 3000.toInt() : 3000} ${AppLocalizations.of(context)!.egp}',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 21.w)),
                        SizedBox(
                          width: 20.w,
                        ),
                        RichText(
                          text: TextSpan(
                            text:
                                '${5000 % 10 == 0 ? 5000.toInt() : 5000} ${AppLocalizations.of(context)!.egp}',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: AppColors.grey,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: AppColors.grey,
                                    decorationThickness: 2.h,
                                    fontSize: 19.w),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(),
                          ),
                          height: 26.52.h,
                          width: 18.72.w,
                          child: InkWell(
                            child: Icon(
                              Icons.add,
                              size: 15.w,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(),
                          ),
                          height: 32.h,
                          width: 74.w,
                          child: Center(child: Text(1.toString())),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(),
                          ),
                          height: 26.52.h,
                          width: 18.72.w,
                          child: InkWell(
                            child: Icon(
                              Icons.remove,
                              size: 15.w,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.h,
            ),
            Container(
                width: 397.w,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: const DashedBorder.fromBorderSide(
                        dashLength: 4,
                        side: BorderSide(color: Colors.black, width: 2))),
                child: Column(
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.price}: 3000 ${AppLocalizations.of(context)!.egp}',
                      style: dataStyle.copyWith(
                          fontSize: 20.w,
                          color: AppColors.darkBrown,
                          fontWeight: FontWeight.bold),
                    ),
                    ProductDataItem(
                        icon: AppAssets.sofaFilled,
                        title: AppLocalizations.of(context)!.product_name,
                        data: 'مطبخ مفتوح'),
                    SizedBox(
                      height: 21.h,
                    ),
                    ProductDataItem(
                        icon: AppAssets.color,
                        title: AppLocalizations.of(context)!.color,
                        data: 'بني فاتح'),
                    SizedBox(
                      height: 21.h,
                    ),
                    ProductDataItem(
                        icon: AppAssets.customer,
                        title: AppLocalizations.of(context)!.customer_name,
                        data: 'علي أحمد محمود'),
                    SizedBox(
                      height: 21.h,
                    ),
                    ProductDataItem(
                        icon: AppAssets.phone,
                        title: AppLocalizations.of(context)!.phone_number,
                        data: '01015151655'),
                    SizedBox(
                      height: 21.h,
                    ),
                    ProductDataItem(
                        icon: AppAssets.locationSolid,
                        title: AppLocalizations.of(context)!.location,
                        data: 'طنطا - غربية'),
                    SizedBox(
                      height: 21.h,
                    ),
                    ProductDataItem(
                        icon: AppAssets.van,
                        title: AppLocalizations.of(context)!.service,
                        data: 'توصيل فقط'),
                    SizedBox(
                      height: 21.h,
                    ),
                    ProductDataItem(
                        icon: AppAssets.locationSolid,
                        title: AppLocalizations.of(context)!.address,
                        data: 'شارع حسان بن ثابت - قسم ثان طنطا - غربية')
                  ],
                )),
            SizedBox(height: 60.h,)
          ],
        );
      },
    );
  }
}
