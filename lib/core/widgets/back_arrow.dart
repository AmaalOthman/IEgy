import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/database/cache/cache_helper.dart';
import 'package:iegy/core/services/service_locator.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/widgets/custom_image.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: sl<CacheHelper>().getCachedLanguage() == 'ar'
          ? CustomImage(imagePath: AppAssets.back, h: 21.h, w: 27.w)
          : Transform(
              transform: Matrix4.identity()..scale(-1.0, 1.0),
              alignment: Alignment.center,
        child: CustomImage(imagePath: AppAssets.back, h: 21.h, w: 27.w),
            ),
    );
  }
}
