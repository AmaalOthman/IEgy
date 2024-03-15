import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationWidget extends StatelessWidget {
  NotificationWidget({super.key, required this.index, this.onTap, required this.title, required this.details});
  int index;
  VoidCallback? onTap;
  String title, details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          minVerticalPadding: 0,
          onTap: onTap,
          leading: CustomImage(
              imagePath: index == 0
                  ? AppAssets.orderNotification
                  : index == 1
                      ? AppAssets.offerNotification
                      : AppAssets.infoOutline, w: 20.w, h: 20.h,),
          title: Text(index == 0
              ? AppLocalizations.of(context)!.orders
              : index == 1
                  ? AppLocalizations.of(context)!.offers
                  : AppLocalizations.of(context)!.about_us_ii, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.w),),
          subtitle: SizedBox(width: 205.w,
          child: Text(title, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 16.w),),
          ),
          trailing: CustomImage(imagePath: AppAssets.x, h: 12.h, w: 12.w),
        ),
        Row(
          children: [
            SizedBox(
                width: 205.w,
                child: Text(details, style: Theme.of(context).textTheme.displaySmall,)),
            const Spacer(),
            Text('21-12-2023 08:00', style: Theme.of(context).textTheme.displaySmall,)
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16.h),
          width: double.infinity,
          color: AppColors.lightBrown,
          height: .3,
        )
      ],
    );
  }
}
