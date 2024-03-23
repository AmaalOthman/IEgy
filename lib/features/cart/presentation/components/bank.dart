import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';

class Bank extends StatelessWidget {
  const Bank({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 49.75.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      height: 100.h,
      width: 187.w,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        errorWidget: (context, url, error) =>
        const CustomImage(imagePath: AppAssets.errorImage),
        // placeholder: (context, url) => const CustomImage(imagePath: AppAssets.placeholder),
        progressIndicatorBuilder: (context, url, progress) => SizedBox(
            width: 228.w,
            child: const Center(child: CustomLoadingIndicator())),
      ),
    );
  }
}
