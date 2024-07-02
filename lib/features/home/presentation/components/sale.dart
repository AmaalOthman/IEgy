import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/database/cache/cache_helper.dart';
import 'package:iegy/core/services/service_locator.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/utils/common_methods.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Sale extends StatelessWidget {
  const Sale({super.key, this.fav});
  final bool? fav;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 251.h,
      width: 182.w,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(6)),
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                height: 119.h,
                width: 162.w,
                imageUrl:
                    'https://www.oppeinhome.com/upload/images/ueditor/20230912/top-kitchen-design-ideas-that-inspire-you-1.webp',
                errorWidget: (context, url, error) =>
                    const CustomImage(imagePath: AppAssets.errorImage),
                // placeholder: (context, url) => const CustomImage(imagePath: AppAssets.placeholder),
                progressIndicatorBuilder: (context, url, progress) => SizedBox(
                    width: 228.w,
                    child: const Center(child: CustomLoadingIndicator())),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                Text(
                  'مطبخ',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Spacer(),
                const CircleAvatar(maxRadius: 7, backgroundColor: AppColors.grey),
                SizedBox(
                  width: 3.w,
                ),
                const CircleAvatar(
                  maxRadius: 7,
                  backgroundColor: AppColors.brown,
                ),
                SizedBox(
                  width: 3.w,
                ),
                const CircleAvatar(
                  maxRadius: 7,
                  backgroundColor: AppColors.darkBrown,
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                Text(
                  '(738)',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Icon(
                  CupertinoIcons.star_fill,
                  color: AppColors.gold,
                  size: 9.75.w,
                ),
                Icon(
                  CupertinoIcons.star_fill,
                  color: AppColors.gold,
                  size: 9.75.w,
                ),
                Icon(
                  CupertinoIcons.star_fill,
                  color: AppColors.gold,
                  size: 9.75.w,
                ),
                Icon(
                  CupertinoIcons.star_fill,
                  color: AppColors.gold,
                  size: 9.75.w,
                ),
                Icon(
                  CupertinoIcons.star_fill,
                  color: AppColors.gold,
                  size: 9.75.w,
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Text(
                  '3000 ${AppLocalizations.of(context)!.egp}',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 19.w),
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    text: '5000 ${AppLocalizations.of(context)!.egp}',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.grey,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.grey,
                          decorationThickness: 2.h,
                        ),
                  ),
                )
              ],
            ),
            const Spacer(),
            if (fav != true)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    w: sl<CacheHelper>().getCachedLanguage() == 'ar'
                        ? 140.w
                        : 120.w,
                    h: 24.h,
                    onPressed: () {},
                    text: AppLocalizations.of(context)!.add_to_cart,
                    textStyle: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 10.w, color: AppColors.white),
                    borderRadius: 5,
                  )
                ],
              )
          ]),
        ),
        Positioned(
          top: 12.h,
          right: isArabic()? 12.w: null,
          left: isArabic()? null: 12.w,
          child: CircleAvatar(
              backgroundColor: fav == true
                  ? Theme.of(context).primaryColor
                  : AppColors.offWhite,
              maxRadius: 15.w,
              child: Icon(
                fav == true ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                color: fav == true ? AppColors.red : AppColors.grey,
                size: 20.h,
              )),
        ),
        if (fav == true)
          Positioned(
              bottom: 0,
              left: isArabic() ? 0 : null,
              right: !isArabic() ? 0 : null,
              child: Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.only(
                          topRight: isArabic()
                              ? const Radius.circular(6)
                              : const Radius.circular(0),
                          topLeft: isArabic()
                              ? const Radius.circular(0)
                              : const Radius.circular(6),
                          bottomLeft: isArabic()
                              ? const Radius.circular(6)
                              : const Radius.circular(0),
                          bottomRight: isArabic()
                              ? const Radius.circular(0)
                              : const Radius.circular(6))), child: Icon(CupertinoIcons.delete_solid, color: AppColors.lightBrown, size: 19.h)))
      ]),
    );
  }
}