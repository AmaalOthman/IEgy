import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/features/home/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/filter_cubit/filter_state.dart';

class FilterColor extends StatelessWidget {
  FilterColor(
      {super.key,
      required this.selected,
      required this.text,
      required this.index});

  bool selected;
  String text;
  int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        return SizedBox(
          width: 71,
          height: 24,
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            /*minWidth: 83  ,
            height: 30,*/
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            onPressed: () =>
                BlocProvider.of<FilterCubit>(context).onColorPressed(index),
            color: selected ? AppColors.lightBrown : AppColors.white,
            child: Row(
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 12,
                      color: selected ? AppColors.white : AppColors.darkBlue),
                ),
                const Spacer(),
                if (index == 0)
                  CustomImage(imagePath: AppAssets.colors, h: 13.33.h, w: 13.33)
                else
                  Container(
                    height: 13.33.h,
                    width: 13.33,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: index == 5? Border.all(color: AppColors.grey): null,
                        color: index == 1
                            ? AppColors.grey
                            : index == 2
                                ? AppColors.blue
                                : index == 3
                                    ? AppColors.green
                                    : index == 4
                                        ? AppColors.red
                                        : index == 5
                                            ? AppColors.white
                                            : index == 6
                                                ? AppColors.yellow
                                                : AppColors.black)
                  )
              ]
            )
          ),
        );
      }
    );
  }
}
