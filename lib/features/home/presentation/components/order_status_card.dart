import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_colors.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({super.key, required this.title, required this.details});
  final String title, details;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: AppColors.lightBrown,
      child: Container(
        height: 56.h,
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.white)),
                const Spacer(),
                Text(details, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14.h, color: AppColors.white)),
                SizedBox(height: 4.h,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
