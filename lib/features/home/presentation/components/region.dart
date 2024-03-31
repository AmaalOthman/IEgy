import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/line.dart';

class Region extends StatelessWidget {
  const Region({super.key, required this.region, required this.price});
  final String region;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(region, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.h, color: AppColors.white)),
            const Spacer(),
            Text('$price ${AppLocalizations.of(context)!.egp}', style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.white))
          ]
        ),
        SizedBox(height: 8.h),
        const Line(color: AppColors.brown,),
        SizedBox(height: 14.h)
      ]
    );
  }
}
