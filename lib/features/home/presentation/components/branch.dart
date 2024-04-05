import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/features/home/presentation/cubit/branches_cubit/branches_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/branches_cubit/branches_state.dart';

class Branch extends StatelessWidget {
  const Branch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchesCubit, BranchesState>(
  builder: (context, state) {
    return GestureDetector(
      onTap: () => BlocProvider.of<BranchesCubit>(context).openLocation(context),
      child: Card(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.gesr_asswais_branch, style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.white, fontSize: 18.w, fontWeight: FontWeight.w700),),
                      Text(AppLocalizations.of(context)!.othman_eissa_st_off_trolley_st, style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.white),)
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios, color: AppColors.white, size: 18.w,)
                ],
              ),
            )),
      ),
    );
  },
);
  }
}
