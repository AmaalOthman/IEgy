import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/database/cache/cache_helper.dart';
import 'package:iegy/core/services/service_locator.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';
import 'package:iegy/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:iegy/features/profile/presentation/cubit/profile_cubit/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
  builder: (context, state) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.my_account,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          leading: IconButton(
            onPressed: () =>
                BlocProvider.of<ProfileCubit>(context).onBackPressed(context),
            icon: Icon(sl<CacheHelper>().getCachedLanguage() == 'ar'
                ? CupertinoIcons.arrow_turn_up_right
                : CupertinoIcons.arrow_turn_up_left),
          ),
        ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 68.h, horizontal: 15.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: 102.h,
                  width: 102.w,
                  imageUrl:
                  'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                  errorWidget: (context, url, error) =>
                  const CustomImage(imagePath: AppAssets.errorImage),
                  progressIndicatorBuilder: (context, url, progress) => SizedBox(
                      width: 180.w,
                      child: const Center(child: CustomLoadingIndicator())),
                  imageBuilder: (context, imageProvider) => Container(
                    width: 148.w,
                    height: 131.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text('Ali Ahmed', style: Theme.of(context).textTheme.displayLarge,),
                    Text('aliahmed@gmail.com', style: Theme.of(context).textTheme.displaySmall,),
                    Text('01015151655', style: Theme.of(context).textTheme.displaySmall,),
                  ],
                ),
                MaterialButton(
                  padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 15.h),
                  minWidth: 0,
                  height: 30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: () {},
                  color: AppColors.lightBrown,
                  child: CustomImage(imagePath: AppAssets.pin, h: 16.67.h, w: 16.67.w,),
                )
              ],
            ),
             ListTile(
              title: Text(AppLocalizations.of(context)!.orders, style: Theme.of(context).textTheme.displayMedium,),
              leading: CustomImage(imagePath: AppAssets.orders, h: 20.h, w: 16.w,),
               trailing: Icon(sl<CacheHelper>().getCachedLanguage()== 'ar'? Icons.keyboard_arrow_left_rounded: Icons.keyboard_arrow_right_rounded),
            )
          ],
        ),
      ),
    );
  },
);
  }
}