import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/features/cart/presentation/components/data_input_field.dart';

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
            style: dataStyle.copyWith(
                color: AppColors.darkBrown,
                fontSize: 14,
                fontWeight: FontWeight.bold)),
        Flexible(
          child: Text(data,
              style: dataStyle.copyWith(color: AppColors.darkBrown, fontSize: 14), overflow: TextOverflow.visible,
            softWrap: true),
        )
      ],
    );
  }
}
