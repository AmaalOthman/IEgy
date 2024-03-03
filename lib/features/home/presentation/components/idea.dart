import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Idea extends StatelessWidget {
  const Idea({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            height: 154.h,
            width: 256.w,
            imageUrl:
                'https://cdn.alweb.com/thumbs/family/article/fit710x532/%D8%A3%D9%81%D9%83%D8%A7%D8%B1-%D8%AF%D9%8A%D9%83%D9%88%D8%B1%D8%A7%D8%AA-%D8%BA%D8%B1%D9%81-%D9%86%D9%88%D9%85-%D8%A8%D9%86%D8%A7%D8%AA-%D9%83%D8%A8%D8%A7%D8%B1.jpg',
            errorWidget: (context, url, error) =>
                const CustomImage(imagePath: AppAssets.errorImage),
            // placeholder: (context, url) => const CustomImage(imagePath: AppAssets.placeholder),
            progressIndicatorBuilder: (context, url, progress) => SizedBox(
                width: 228.w,
                child: const Center(child: CustomLoadingIndicator())),
          ),
        ),
        Positioned(
          top: 15.h,
          right: 6.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.dressing_room,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppColors.white),
              ),
              Text(
                '6 ${AppLocalizations.of(context)!.pieces}',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: AppColors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
