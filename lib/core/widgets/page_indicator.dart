import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, required this.selected, this.width});

  final bool selected;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: width ?? 88.w,
      decoration: BoxDecoration(
          color: selected? AppColors.brown: AppColors.offWhite,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
