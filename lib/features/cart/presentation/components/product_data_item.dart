import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';

class ProductDataItem extends StatelessWidget {
  const ProductDataItem(
      {super.key, required this.icon, required this.title, required this.data});
  final String icon, title, data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImage(imagePath: icon, h: 20.h, w: 20.w),
        SizedBox(
          width: 8.w,
        ),
        Text('$title: ',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 14)),
        Flexible(
          child: Text(data,
              style:
                  Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.darkBrown),
              overflow: TextOverflow.visible,
              softWrap: true),
        )
      ],
    );
  }
}