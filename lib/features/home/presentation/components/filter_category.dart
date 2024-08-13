import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/features/home/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/filter_cubit/filter_state.dart';

class FilterCategory extends StatelessWidget {
  FilterCategory(
      {super.key,
      required this.selected,
      required this.text,
      required this.index});

  bool selected;
  String text;
  int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(builder: (context, state) {
      return MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          minWidth: 0,
          height: 30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onPressed: () =>
              BlocProvider.of<FilterCubit>(context).onCategoryPressed(index),
          color: selected ? AppColors.lightBrown : AppColors.white,
          child: Text(text,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 12,
                  color: selected ? AppColors.white : AppColors.darkBlue)));
    });
  }
}