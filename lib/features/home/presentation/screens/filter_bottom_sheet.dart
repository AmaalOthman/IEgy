import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/features/home/presentation/components/filter_category.dart';
import 'package:iegy/features/home/presentation/components/filter_color.dart';
import 'package:iegy/features/home/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/filter_cubit/filter_state.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<FilterCubit>(context).reset();
        return true;
      },
      child: Container(
        height: 548.h,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
          child: BlocBuilder<FilterCubit, FilterState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.filter,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 20.w),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () => BlocProvider.of<FilterCubit>(context)
                              .onXPressed(context),
                          child: CustomImage(
                              imagePath: AppAssets.x, h: 13.15.h, w: 13.15.w))
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.price_ranges_between,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 12.w),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
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
                              ]),
                          child: CustomButton(
                            onPressed: () {},
                            text:
                                '${BlocProvider.of<FilterCubit>(context).priceRanges.start.toInt()} ${AppLocalizations.of(context)!.egp}',
                            h: 40.h,
                            w: 179.5.w,
                            background: AppColors.white,
                            elevation: 0,
                            borderRadius: 12,
                            textStyle: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 16.w),
                          )),
                      Text(
                        AppLocalizations.of(context)!.to,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 16),
                      ),
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
                              ]),
                          child: CustomButton(
                            onPressed: () {},
                            text:
                                '${BlocProvider.of<FilterCubit>(context).priceRanges.end.toInt()} ${AppLocalizations.of(context)!.egp}',
                            h: 40.h,
                            w: 179.5.w,
                            background: AppColors.white,
                            elevation: 0,
                            borderRadius: 12,
                            textStyle: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 16.w),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  RangeSlider(
                    values: BlocProvider.of<FilterCubit>(context).priceRanges,
                    onChanged: (RangeValues newRange) =>
                        BlocProvider.of<FilterCubit>(context)
                            .onSliderChanges(newRange),
                    min: 1000,
                    max: 10000,
                    divisions: 500,
                    activeColor: AppColors.brown,
                    inactiveColor: AppColors.lightBrown,
                    labels: RangeLabels(
                      BlocProvider.of<FilterCubit>(context)
                          .priceRanges
                          .start
                          .toInt()
                          .toString(),
                      BlocProvider.of<FilterCubit>(context)
                          .priceRanges
                          .end
                          .toInt()
                          .toString(),
                    ),
                  ),
                  SizedBox(
                    height: 19.87.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.category,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 20.w),
                  ),
                  Row(
                    children: [
                      FilterCategory(
                        selected: BlocProvider.of<FilterCubit>(context)
                            .categorySelection[0],
                        text: AppLocalizations.of(context)!.all,
                        index: 0,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      FilterCategory(
                        selected: BlocProvider.of<FilterCubit>(context)
                            .categorySelection[1],
                        text: AppLocalizations.of(context)!.sofas,
                        index: 1,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      FilterCategory(
                        selected: BlocProvider.of<FilterCubit>(context)
                            .categorySelection[2],
                        text: AppLocalizations.of(context)!.sofra,
                        index: 2,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      FilterCategory(
                        selected: BlocProvider.of<FilterCubit>(context)
                            .categorySelection[3],
                        text: AppLocalizations.of(context)!.doors,
                        index: 3,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      FilterCategory(
                        selected: BlocProvider.of<FilterCubit>(context)
                            .categorySelection[4],
                        text: AppLocalizations.of(context)!.bed_rooms,
                        index: 4,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      FilterCategory(
                        selected: BlocProvider.of<FilterCubit>(context)
                            .categorySelection[5],
                        text: AppLocalizations.of(context)!.chairs,
                        index: 5,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      FilterCategory(
                        selected: BlocProvider.of<FilterCubit>(context)
                            .categorySelection[6],
                        text: AppLocalizations.of(context)!.tables,
                        index: 6,
                      )
                    ],
                  ),
                  Text(
                    AppLocalizations.of(context)!.color,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 20.w),
                  ),
                  Row(
                    children: [
                      FilterColor(
                          selected: BlocProvider.of<FilterCubit>(context)
                              .colorSelection[0],
                          text: AppLocalizations.of(context)!.all,
                          index: 0),
                      SizedBox(
                        width: 14.w,
                      ),
                      FilterColor(
                          selected: BlocProvider.of<FilterCubit>(context)
                              .colorSelection[1],
                          text: AppLocalizations.of(context)!.grey,
                          index: 1),
                      SizedBox(
                        width: 14.w,
                      ),
                      FilterColor(
                          selected: BlocProvider.of<FilterCubit>(context)
                              .colorSelection[2],
                          text: AppLocalizations.of(context)!.blue,
                          index: 2),
                      SizedBox(
                        width: 14.w,
                      ),
                      FilterColor(
                          selected: BlocProvider.of<FilterCubit>(context)
                              .colorSelection[3],
                          text: AppLocalizations.of(context)!.green,
                          index: 3)
                    ],
                  ),
                  Row(
                    children: [
                      FilterColor(
                          selected: BlocProvider.of<FilterCubit>(context)
                              .colorSelection[4],
                          text: AppLocalizations.of(context)!.red,
                          index: 4),
                      SizedBox(
                        width: 14.w,
                      ),
                      FilterColor(
                          selected: BlocProvider.of<FilterCubit>(context)
                              .colorSelection[5],
                          text: AppLocalizations.of(context)!.white,
                          index: 5),
                      SizedBox(
                        width: 14.w,
                      ),
                      FilterColor(
                          selected: BlocProvider.of<FilterCubit>(context)
                              .colorSelection[6],
                          text: AppLocalizations.of(context)!.yellow,
                          index: 6),
                      SizedBox(
                        width: 14.w,
                      ),
                      FilterColor(
                          selected: BlocProvider.of<FilterCubit>(context)
                              .colorSelection[7],
                          text: AppLocalizations.of(context)!.black,
                          index: 7)
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      CustomButton(onPressed: () => BlocProvider.of<FilterCubit>(context).applyFiltration(context), text: AppLocalizations.of(context)!.apply_filtration, w: 191.w),
                      SizedBox(width: 12.w,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: AppColors.grey)
                        ),
                        child: CustomButton(
                          elevation: 0,
                          onPressed: () => BlocProvider.of<FilterCubit>(context).reset(), text: AppLocalizations.of(context)!.reset, w: 191.w, background: AppColors.white, textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.w, color: AppColors.darkBlue),),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
