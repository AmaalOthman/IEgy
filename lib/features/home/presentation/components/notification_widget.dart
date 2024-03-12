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
          onTap: onTap,
          leading: CustomImage(
              imagePath: index == 0
                  ? AppAssets.orderNotification
                  : index == 1
                      ? AppAssets.offerNotification
                      : AppAssets.infoOutline, w: 20.w, h: 20.h,),
          title: Text(index == 0
              ? AppLocalizations.of(context)!.offers
              : index == 1
                  ? AppLocalizations.of(context)!.orders
                  : AppLocalizations.of(context)!.about_us_ii),
          subtitle: SizedBox(width: 205.w,
          child: Text(title),
          ),
          trailing: const Icon(CupertinoIcons.xmark, color: AppColors.darkBlue,),
        ),
        Row(
          children: [
            SizedBox(
                width: 205.w,
                child: Text(details)),
            const Spacer(),
            const Text('21-12-2023 08:00')
          ],
        ),
        Container(
          width: double.infinity,
          color: AppColors.lightBrown,
          height: .3,
        )
      ],
    );
  }
}
