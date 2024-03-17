import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/database/cache/cache_helper.dart';
import 'package:iegy/core/services/service_locator.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
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
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 84.h),
            child: Column(
              children: [
                const Spacer(),
                AppBar(
                  title: Text(
                    AppLocalizations.of(context)!.my_account,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  leading: IconButton(
                    onPressed: () =>
                        BlocProvider.of<ProfileCubit>(context).onBackPressed(context),
                    icon: const BackArrow(),
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 70.h, horizontal: 15.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.15),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ], borderRadius: BorderRadius.circular(500)),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        height: 102.h,
                        width: 102.w,
                        imageUrl:
                            'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                        errorWidget: (context, url, error) =>
                            const CustomImage(imagePath: AppAssets.errorImage),
                        progressIndicatorBuilder: (context, url, progress) =>
                            SizedBox(
                                width: 180.w,
                                child: const Center(
                                    child: CustomLoadingIndicator())),
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
                    ),
                    Column(
                      children: [
                        Text(
                          'Ali Ahmed',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          'aliahmed@gmail.com',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          '01015151655',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 15.h),
                      minWidth: 0,
                      height: 30,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      onPressed: () => BlocProvider.of<ProfileCubit>(context).editProfile(context),
                      color: AppColors.lightBrown,
                      child: CustomImage(
                        imagePath: AppAssets.pin,
                        h: 16.67.h,
                        w: 16.67.w,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 64.h,
                ),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.orders,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16.w),
                  ),
                  leading: CustomImage(
                    imagePath: AppAssets.orders,
                    h: 20.h,
                    w: 16.w,
                  ),
                  trailing: Icon(sl<CacheHelper>().getCachedLanguage() == 'ar'
                      ? Icons.keyboard_arrow_left_rounded
                      : Icons.keyboard_arrow_right_rounded),
                ),
                Container(
                  width: double.infinity,
                  height: .3.h,
                  color: AppColors.lightBrown,
                ),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.my_address,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16.w),
                  ),
                  leading: CustomImage(
                    imagePath: AppAssets.locationSolid,
                    h: 20.h,
                    w: 17.w,
                  ),
                  trailing: Icon(sl<CacheHelper>().getCachedLanguage() == 'ar'
                      ? Icons.keyboard_arrow_left_rounded
                      : Icons.keyboard_arrow_right_rounded),
                ),
                Container(
                  width: double.infinity,
                  height: .3.h,
                  color: AppColors.lightBrown,
                ),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.notifications,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16.w),
                  ),
                  leading: ImageIcon(
                    const AssetImage(AppAssets.notifications),
                    color: AppColors.darkBlue,
                    size: 20.w,
                  ),
                  trailing: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.darkBlue
                        ),
                        height: 24.h,
                        width: 40.w,
                      ),
                      Positioned(
                          right: 2,
                          top: 2.h,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5000),
                              color: AppColors.white
                            ),
                            width: 20.w,
                            height: 20.h,
                          ))
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: .3.h,
                  color: AppColors.lightBrown,
                ),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)!.reset_password,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16.w),
                  ),
                  leading: CustomImage(
                    imagePath: AppAssets.lockerAndKey,
                    h: 22.h,
                    w: 19.w,
                  ),
                  trailing: Icon(sl<CacheHelper>().getCachedLanguage() == 'ar'
                      ? Icons.keyboard_arrow_left_rounded
                      : Icons.keyboard_arrow_right_rounded),
                ),
                Container(
                  width: double.infinity,
                  height: .3.h,
                  color: AppColors.lightBrown,
                ),
                // SizedBox(height: 188.h),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: CustomButton(
                    icon: CustomImage(imagePath: AppAssets.logOut, h: 16.4.h, w: 20.w),
                    background: Colors.transparent,
                    elevation: 0,
                    textStyle: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 16.w),
                    withIcon: true,
                    onPressed: () => BlocProvider.of<ProfileCubit>(context).goToLogin(context), text: AppLocalizations.of(context)!.log_out, h: 48.h, w: 195.w,),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
