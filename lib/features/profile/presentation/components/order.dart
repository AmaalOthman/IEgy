import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25)
      ),
      padding: EdgeInsets.only(top: 5.h),
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          CachedNetworkImage(
            fit: BoxFit.fill,
            height: 119.h,
            width: 162.w,
            imageUrl:
            'https://d248k8q1c80cf8.cloudfront.net/WK_Seito_0017_tif_584372fb43.jpg',
            errorWidget: (context, url, error) =>
            const CustomImage(imagePath: AppAssets.errorImage),
            // placeholder: (context, url) => const CustomImage(imagePath: AppAssets.placeholder),
            progressIndicatorBuilder: (context, url, progress) => SizedBox(
                width: 228.w,
                child: const Center(child: CustomLoadingIndicator())),
          ),
          SizedBox(width: 18.w,),
          Column(
            children: [
              Row(
                children: [
                  Text(AppLocalizations.of(context)!.product_name)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
