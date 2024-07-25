import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/functions/common_methods.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_text_form_field.dart';
import 'package:iegy/core/widgets/page_indicator.dart';
import 'package:iegy/features/cart/presentation/components/bank.dart';
import 'package:iegy/features/cart/presentation/cubit/payment_cubit/payment_cubit.dart';
import 'package:iegy/features/cart/presentation/cubit/payment_cubit/payment_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentDataScreen extends StatelessWidget {
  const PaymentDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PageIndicator(selected: false),
                PageIndicator(selected: false),
                PageIndicator(selected: true),
                PageIndicator(selected: false)
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Text(
                    '${BlocProvider.of<PaymentCubit>(context).currentPhase + 1}/${BlocProvider.of<PaymentCubit>(context).phases.length}'),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              height: 332.h,
              width: 187.w,
              child: ListView(
                children: [
                  const Bank(
                    imageUrl:
                        'https://www.banquemisr.com/Assets/Images/default.jpg',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const Bank(
                    imageUrl:
                        'https://alsawaqi.com/wp-content/uploads/2023/08/%D8%A7%D8%B2%D8%A7%D9%89-%D8%A7%D8%A8%D8%B9%D8%AA-%D9%81%D9%84%D9%88%D8%B3-%D9%81%D9%88%D8%AF%D8%A7%D9%81%D9%88%D9%86-%D9%83%D8%A7%D8%B4-%D8%A8%D8%B3%D9%87%D9%88%D9%84%D8%A9-1024x576.webp',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const Bank(
                    imageUrl:
                        'https://img.wataninet.com/2019/04/Untitled-1-98-567x338.jpg',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const Bank(
                    imageUrl:
                        'https://www.fastfutures.com/app/uploads/2022/04/HSBC-Symbol-png.webp',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80.w,
                  height: 1.h,
                  color: AppColors.lightBrown,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  AppLocalizations.of(context)!.or,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 14.w, color: AppColors.darkBlue),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Container(
                  width: 80.w,
                  height: 1.h,
                  color: AppColors.lightBrown,
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
                // height: 42.h,
                width: 203.w,
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.lightBrown),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImage(
                          imagePath: AppAssets.cash, h: 27.h, w: 43.2.w),
                      SizedBox(width: 10.w),
                      Expanded(
                          child: Text(
                              AppLocalizations.of(context)!
                                  .cash_payment_upon_delivery,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      color: AppColors.white, fontSize: 14.w),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2))
                    ])),
            SizedBox(
              height: 26.h,
            ),
            CustomTextFormField(
              hint: AppLocalizations.of(context)!.enter_discount_promo_code,
              suffixIcon: isArabic()
                  ? CustomImage(imagePath: AppAssets.send, w: 17.9.w, h: 18.h)
                  : Transform(
                      transform: Matrix4.identity()..setEntry(0, 0, -1),
                      alignment: Alignment.center,
                      child: CustomImage(
                          imagePath: AppAssets.send, w: 17.9.w, h: 18.h)),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.total,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.darkBlue),
                ),
                const Spacer(),
                Text(
                  '3000 ${AppLocalizations.of(context)!.egp}',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.brown),
                )
              ],
            ),
            SizedBox(
              height: 60.h,
            )
          ],
        );
      },
    );
  }
}
