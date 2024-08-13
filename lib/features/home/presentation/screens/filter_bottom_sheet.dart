import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
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
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () async {
          BlocProvider.of<FilterCubit>(context).reset();
          return true;
        },
        child: Container(
            height: 548.h,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14),
                child: BlocBuilder<FilterCubit, FilterState>(
                    builder: (context, state) {
                  return SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.filter,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontSize: 20.h)
                            ),
                            const Spacer(),
                            GestureDetector(
                                onTap: () =>
                                    BlocProvider.of<FilterCubit>(context)
                                        .onXPressed(context),
                                child: const CustomImage(
                                    imagePath: AppAssets.x, h: 13.15, w: 13.15))
                          ],
                        ),
                         SizedBox(
                          height: 16.h
                        ),
                        Text(
                          AppLocalizations.of(context)!.price_ranges_between,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 12),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.black.withOpacity(0.15),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: const Offset(0, 3)
                                      )
                                    ]),
                                child: CustomButton(
                                  onPressed: () {},
                                  text:
                                      '${BlocProvider.of<FilterCubit>(context).priceRanges.start.toInt()} ${AppLocalizations.of(context)!.egp}',
                                  h: 40,
                                  w: width> 500? 250: 149.5,
                                  background: AppColors.white,
                                  elevation: 0,
                                  borderRadius: 12,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(fontSize: 16)
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
                                        color:
                                            AppColors.black.withOpacity(0.15),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]),
                                child: CustomButton(
                                  onPressed: () {},
                                  text:
                                      '${BlocProvider.of<FilterCubit>(context).priceRanges.end.toInt()} ${AppLocalizations.of(context)!.egp}',
                                  h: 40,
                                  w: width> 500? 250: 149.5,
                                  background: AppColors.white,
                                  elevation: 0,
                                  borderRadius: 12,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(fontSize: 16),
                                ))
                          ],
                        ),
                        const SizedBox(height: 12),
                        RangeSlider(
                          values:
                              BlocProvider.of<FilterCubit>(context).priceRanges,
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
                        SizedBox(height: 19.87.h),
                        Text(AppLocalizations.of(context)!.category,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 20)),
                        Wrap(
                            spacing: 12, // Space between items
                            runSpacing: 0, // Space between lines
                            children:[
                              FilterCategory(
                                selected: BlocProvider.of<FilterCubit>(context)
                                    .categorySelection[0],
                                text: AppLocalizations.of(context)!.all,
                                index: 0,
                              ),
                              FilterCategory(
                                  selected: BlocProvider.of<FilterCubit>(context)
                                      .categorySelection[1],
                                  text: AppLocalizations.of(context)!.sofas,
                                  index: 1),
                              FilterCategory(
                                selected: BlocProvider.of<FilterCubit>(context)
                                    .categorySelection[2],
                                text: AppLocalizations.of(context)!.sofra,
                                index: 2,
                              ),
                              FilterCategory(
                                selected: BlocProvider.of<FilterCubit>(context)
                                    .categorySelection[3],
                                text: AppLocalizations.of(context)!.doors,
                                index: 3,
                              ),
                              FilterCategory(
                                selected: BlocProvider.of<FilterCubit>(context)
                                    .categorySelection[4],
                                text: AppLocalizations.of(context)!.bed_rooms,
                                index: 4,
                              ),
                              FilterCategory(
                                selected: BlocProvider.of<FilterCubit>(context)
                                    .categorySelection[5],
                                text: AppLocalizations.of(context)!.chairs,
                                index: 5,
                              ),
                              FilterCategory(
                                  selected: BlocProvider.of<FilterCubit>(context)
                                      .categorySelection[6],
                                  text: AppLocalizations.of(context)!.tables,
                                  index: 6)
                            ]
                        ),
                        Text(AppLocalizations.of(context)!.color,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 20)),
                        const Gap(8),
                        Wrap(
                          spacing: 14, // Space between items
                          runSpacing: 12,
                          children: [
                            FilterColor(
                                selected: BlocProvider.of<FilterCubit>(context)
                                    .colorSelection[0],
                                text: AppLocalizations.of(context)!.all,
                                index: 0),
                            FilterColor(
                                selected: BlocProvider.of<FilterCubit>(context)
                                    .colorSelection[1],
                                text: AppLocalizations.of(context)!.grey,
                                index: 1),
                            FilterColor(
                                selected: BlocProvider.of<FilterCubit>(context)
                                    .colorSelection[2],
                                text: AppLocalizations.of(context)!.blue,
                                index: 2),
                            FilterColor(
                                selected: BlocProvider.of<FilterCubit>(context)
                                    .colorSelection[3],
                                text: AppLocalizations.of(context)!.green,
                                index: 3),
                            FilterColor(
                                selected: BlocProvider.of<FilterCubit>(context)
                                    .colorSelection[4],
                                text: AppLocalizations.of(context)!.red,
                                index: 4),
                            FilterColor(
                                selected: BlocProvider.of<FilterCubit>(context)
                                    .colorSelection[5],
                                text: AppLocalizations.of(context)!.white,
                                index: 5),
                            FilterColor(
                                selected: BlocProvider.of<FilterCubit>(context)
                                    .colorSelection[6],
                                text: AppLocalizations.of(context)!.yellow,
                                index: 6),
                            FilterColor(
                                selected: BlocProvider.of<FilterCubit>(context)
                                    .colorSelection[7],
                                text: AppLocalizations.of(context)!.black,
                                index: 7)
                          ]// Space between lines
                        ),
                        SizedBox(height: 15.h),
                        Row(children: [
                          CustomButton(
                              onPressed: () =>
                                  BlocProvider.of<FilterCubit>(context)
                                      .applyFiltration(context),
                              text: AppLocalizations.of(context)!
                                  .apply_filtration,
                            w: width > 500? 250:171, textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16, color: AppColors.white)),
                          const Spacer(),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: AppColors.grey)),
                              child: CustomButton(
                                  elevation: 0,
                                  onPressed: () =>
                                      BlocProvider.of<FilterCubit>(context)
                                          .reset(),
                                  text: AppLocalizations.of(context)!.reset,
                                  w: width > 500? 250: 171,
                                  background: AppColors.white,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          fontSize: 16,
                                          color: AppColors.darkBlue)))
                        ])
                      ]));
                }))));
  }
}