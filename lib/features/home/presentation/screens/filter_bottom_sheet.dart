import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/features/home/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/filter_cubit/filter_state.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
        child: BlocBuilder<FilterCubit, FilterState>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(AppLocalizations.of(context)!.filter, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20.w),),
                const Spacer(),
                GestureDetector(
                    onTap: () => BlocProvider.of<FilterCubit>(context).onXPressed(context),
                    child: CustomImage(imagePath: AppAssets.x, h: 13.15.h, w: 13.15.w))
              ],
            ),
            SizedBox(height: 16.h,),
            Text(AppLocalizations.of(context)!.price_ranges_between, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 12.w),),
            SizedBox(height: 8.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.15),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    ),
                    child: CustomButton(onPressed: () {}, text: '3000 ${AppLocalizations.of(context)!.egp}', h: 40.h, w: 179.5.w, background: AppColors.white, elevation: 0, borderRadius: 12, textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.w),)),
                Text(AppLocalizations.of(context)!.to, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 16),),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.15),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ]
                    ),
                    child: CustomButton(onPressed: () {}, text: '7000 ${AppLocalizations.of(context)!.egp}', h: 40.h, w: 179.5.w, background: AppColors.white, elevation: 0, borderRadius: 12, textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.w),))
              ],
            ),
            SizedBox(height: 30.h,),
            Slider(
              value: 15,
              min: 0,
              max: 100,
              divisions: 10,
              label: 15.round().toString(),
              onChanged: (double value) {
                /*setState(() {
                  _currentSliderValue = value;
                });*/
              },
            )
          ],
        );
        },
      ),
      ),
    );
  }
}
