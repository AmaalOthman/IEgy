import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';
import 'package:iegy/features/cart/presentation/components/data_input_field.dart';
import 'package:iegy/features/cart/presentation/components/product_data_item.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 87.h),
            child: Column(children: [
              const Spacer(),
              AppBar(
                  title: SizedBox(
                      width: 181.w,
                      child: Text(AppLocalizations.of(context)!.order_details,
                          style: Theme.of(context).textTheme.displayLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center)),
                  leading: const BackArrow())
            ])),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(children: [
              CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:
                      'https://d248k8q1c80cf8.cloudfront.net/WK_Seito_0017_tif_584372fb43.jpg',
                  errorWidget: (context, url, error) =>
                      const CustomImage(imagePath: AppAssets.errorImage),
                  // placeholder: (context, url) => const CustomImage(imagePath: AppAssets.placeholder),
                  progressIndicatorBuilder: (context, url, progress) =>
                      SizedBox(
                          width: 228.w,
                          child: const Center(child: CustomLoadingIndicator()))),
              SizedBox(width: double.infinity, height: 24.h),
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
                        '${AppLocalizations.of(context)!.price}: 870.00 ${AppLocalizations.of(context)!.egp}',
                        style: dataStyle.copyWith(
                            fontSize: 20.w,
                            color: AppColors.darkBrown,
                            fontWeight: FontWeight.bold),
                      ),
                      ProductDataItem(
                          icon: AppAssets.sofaFilled,
                          title: AppLocalizations.of(context)!.product_name,
                          data: 'ترابيزة كلاسيك'),
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
                          icon: AppAssets.locationBrown,
                          title: AppLocalizations.of(context)!.address,
                          data: 'شارع حسان بن ثابت - قسم ثان طنطا - غربية'),
                      SizedBox(
                        height: 21.h,
                      ),
                      ProductDataItem(
                          icon: AppAssets.calendar,
                          title: AppLocalizations.of(context)!.received_on,
                          data: '24/9/2023')
                    ]
                  ))
            ])));
  }
}
