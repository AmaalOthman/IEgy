import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 398.w,
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(
                  color: AppColors.lightBrown),
              maxLines: 1,
            ),
          ),
          Row(
            children: [
              Text(AppLocalizations.of(context)!.more, style: Theme.of(context).textTheme.bodySmall,),
              const Icon(Icons.keyboard_arrow_left_outlined, color: AppColors.lightBrown,),
            ],
          )
        ],
      ),
    );
  }
}
