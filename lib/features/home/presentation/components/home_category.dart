import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';

class HomeCategory extends StatelessWidget {
  HomeCategory(
      {super.key, this.first, required this.icon, required this.label});
  bool? first = false;
  String icon, label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 6.w),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          width: 36.w,
          height: 36.h,
          decoration: BoxDecoration(
              color: first == true ? AppColors.darkBrown : AppColors.white,
              borderRadius: BorderRadius.circular(10)),
          child: CustomImage(imagePath: icon),
        ),
        const Spacer(),
        Text(
          label,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 8.w,
              fontWeight: FontWeight.w900,
              color: AppColors.darkBrown),
        )
      ],
    );
  }
}
