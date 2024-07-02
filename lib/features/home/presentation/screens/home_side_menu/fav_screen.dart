import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_text_form_field.dart';
import 'package:iegy/features/home/presentation/components/filter_category.dart';
import 'package:iegy/features/home/presentation/components/sale.dart';
import 'package:iegy/features/home/presentation/cubit/fav_cubit/fav_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/fav_cubit/fav_state.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
  builder: (context, state) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 84.h),
        child: Column(
          children: [
            const Spacer(),
            AppBar(
              title: Text(
                AppLocalizations.of(context)!.favourites,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              leading: const BackArrow(),
              actions: [
                IconButton(onPressed: () {}, icon: CustomImage(imagePath: AppAssets.add, h: 24.w, w: 24.w))
              ]
            )
          ]
        )
      ),
      body: Column(
        children: [
          SizedBox(height: 19.h,),
          Row(
            children: [SizedBox(width: 16.w,),
              SizedBox(
                  width: 350.w,
                  child: CustomTextFormField(
                    controller: TextEditingController(
                        text: BlocProvider.of<FavCubit>(context)
                            .speechToText
                            .isListening
                            ? "listening.."
                            : BlocProvider.of<FavCubit>(context)
                            .spokenWords),
                    focusNode: BlocProvider.of<FavCubit>(context)
                        .focusNode,
                    shadow: true,
                    preIcon: const Icon(
                      Icons.search,
                      color: AppColors.darkBlue,
                    ),
                    suffixIcon: CustomImage(
                      imagePath: AppAssets.mic,
                      h: 18.h,
                      w: 13.39.w,
                    ),
                    hint: AppLocalizations.of(context)!
                        .what_are_u_looking_for,
                    onSuffixPressed:
                    BlocProvider.of<FavCubit>(context)
                        .onVoiceSearchClicked
                  )),
              SizedBox(width: 8.w),
              IconButton(
                onPressed: () => BlocProvider.of<FavCubit>(context).onFilterPressed(context)
                ,
                icon: CustomImage(
                  imagePath: AppAssets.filter,
                  w: 18.67.w,
                ),
              )
            ]
          ),
          SizedBox(height: 20.h,),
          SizedBox(
            height: 30.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 17.w,),
                FilterCategory(selected: true, text: AppLocalizations.of(context)!.all, index: 0),
                SizedBox(width: 12.w,),
                FilterCategory(selected: false, text: AppLocalizations.of(context)!.chairs, index: 1),
                SizedBox(width: 12.w,),
                FilterCategory(selected: false, text: AppLocalizations.of(context)!.tables, index: 2),
                SizedBox(width: 12.w,),
                FilterCategory(selected: false, text: AppLocalizations.of(context)!.sofas, index: 3),
                SizedBox(width: 12.w,),
                FilterCategory(selected: false, text: AppLocalizations.of(context)!.sofra, index: 4),
                SizedBox(width: 12.w,),
                FilterCategory(selected: false, text: AppLocalizations.of(context)!.doors, index: 5),
                SizedBox(width: 12.w,),
                FilterCategory(selected: false, text: AppLocalizations.of(context)!.bed_rooms, index: 6)
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 24.h,
                  childAspectRatio: 191/242
              ),
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: AppColors.black.withOpacity(0.08),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(0, 3)
                      )]
                    ),
                    child: const Sale(fav: true));
              },
              itemCount: 32,
            )
          )
        ]
      )
    );
  },
);
  }
}