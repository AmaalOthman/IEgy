import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key, this.h, this.w, required this.imgUrl, this.radius});
  final double? h, w, radius;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 20),
      child: CachedNetworkImage(
        height: h,
        width: w,
        imageUrl: imgUrl,
        errorWidget: (context, url, error) =>
        CustomImage(h: h, w: w, imagePath: AppAssets.errorImage),
        // placeholder: (context, url) => const CustomImage(imagePath: AppAssets.placeholder),
        progressIndicatorBuilder: (context, url, progress) => SizedBox(
            width: 228.w,
            child: const Center(child: CustomLoadingIndicator())),
      ),
    );
  }
}
