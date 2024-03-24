import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';

class Branch extends StatelessWidget {
  const Branch({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      color: AppColors.lightBrown,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: 76.h,
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    padding: EdgeInsets.all(10.w),
                    child: const CustomImage(imagePath: AppAssets.map,)),
                SizedBox(width: 16.w,),
                Column(
                  children: [
                    Text('AppLoca')
                  ],
                )
              ],
            ),
          )),
    );
  }
}
