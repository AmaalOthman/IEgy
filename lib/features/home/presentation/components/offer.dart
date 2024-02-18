import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';

class Offer extends StatelessWidget {
  const Offer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(imageUrl: 'https://emkan-furniture.com/wp-content/uploads/2022/11/liety.jpg',
          errorWidget: (context, url, error) => const CustomImage(imagePath: AppAssets.errorImage),
        // placeholder: (context, url) => const CustomImage(imagePath: AppAssets.placeholder),
        progressIndicatorBuilder: (context, url, progress) => SizedBox( width: 228.w, child: const Center(child: CustomLoadingIndicator())),
      ),
    );
  }
}
