import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BaskedItem extends StatelessWidget {
  BaskedItem({super.key, required this.imageUrl, required this.title, required this.price, required this.oldPrice, required this.num});
  String imageUrl, title;
  double price, oldPrice;
  int num;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              height: 131.h,
              width: 148.w,
              imageUrl:
              imageUrl,
              errorWidget: (context, url, error) =>
              const CustomImage(imagePath: AppAssets.errorImage),
              // placeholder: (context, url) => const CustomImage(imagePath: AppAssets.placeholder),
              progressIndicatorBuilder: (context, url, progress) => SizedBox(
                  width: 228.w,
                  child: const Center(child: CustomLoadingIndicator())),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.black),),
              SizedBox(height: 25.h,),
              Row(
                children: [
                  Text('${price % 10 == 0? price.toInt(): price} ${AppLocalizations.of(context)!.egp}', style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 21.w)),
                  SizedBox(width: 20.w,),
                  RichText(
                    text: TextSpan(
                      text: '${oldPrice % 10 == 0? oldPrice.toInt(): oldPrice} ${AppLocalizations.of(context)!.egp}',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColors.grey,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.grey,
                        decorationThickness: 2.h,
                        fontSize: 19.w
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 25.h,),
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
                      child: Icon(Icons.add, size: 15.w,),
                    ),
                  ),
                  SizedBox(width: 6.w,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    height: 32.h,
                    width: 74.w,
                    child: Center(child: Text(num.toString())),
                  ),
                  SizedBox(width: 6.w,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(),
                    ),
                    height: 26.52.h,
                    width: 18.72.w,
                    child: InkWell(
                      child: Icon(Icons.remove, size: 15.w,),
                    ),
                  ),
                ],
              )
            ],
          ),
          const Icon(CupertinoIcons.xmark_square_fill, color: AppColors.brown,)
        ],
      ),
    );
  }
}
