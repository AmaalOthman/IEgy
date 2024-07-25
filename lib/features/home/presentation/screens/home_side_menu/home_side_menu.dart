import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/bloc/cubit/global_cubit.dart';
import 'package:iegy/core/bloc/cubit/global_state.dart';
import 'package:iegy/core/routes/app_routes.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/functions/common_methods.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/features/home/presentation/components/drawer_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/home_cubit/home_state.dart';

class HomeSideMenu extends StatelessWidget {
  const HomeSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(.8),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 72.h),
        child: Column(
          children: [
            const Spacer(),
            AppBar(
              title: CustomImage(
                imagePath: AppAssets.homeLogo,
                h: 40.h,
                w: 95.w,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return ListView(
              children: [
                DrawerItem(
                    iconPath: AppAssets.location,
                    text: AppLocalizations.of(context)!.our_branches,
                    navigateTo: () => BlocProvider.of<HomeCubit>(context)
                        .navigateTo(context, Routes.branchesScreen)),
                BlocBuilder<GlobalCubit, GlobalState>(
                  builder: (context, state) {
                    return DrawerItem(
                        iconPath: AppAssets.glob,
                        text: isArabic() ? 'English' : 'العربية',
                        navigateTo: () {
                          BlocProvider.of<GlobalCubit>(context)
                              .switchLanguage();
                        });
                  },
                ),
                DrawerItem(
                    iconPath: AppAssets.order,
                    text: AppLocalizations.of(context)!.orders_and_tracking,
                    navigateTo: () => BlocProvider.of<HomeCubit>(context)
                        .navigateTo(context, Routes.orderTrackingScreen)),
                DrawerItem(
                    iconPath: AppAssets.heart,
                    text: AppLocalizations.of(context)!.favourites,
                    navigateTo: () => BlocProvider.of<HomeCubit>(context)
                        .navigateTo(context, Routes.favScreen)),
                /*DrawerItem(
                    iconPath: AppAssets.darkMood,
                    text: AppLocalizations.of(context)!.dark_mode,
                    navigateTo: () {}),*/
                DrawerItem(
                    iconPath: AppAssets.exchange,
                    text: AppLocalizations.of(context)!
                        .exchange_and_return_policy,
                    navigateTo: () => BlocProvider.of<HomeCubit>(context)
                        .navigateTo(context, Routes.policyScreen)),
                DrawerItem(
                    iconPath: AppAssets.hummer,
                    text: AppLocalizations.of(context)!.supply_and_installation,
                    navigateTo: () => BlocProvider.of<HomeCubit>(context)
                        .navigateTo(
                            context, Routes.supplyAndInstallationScreen)),
                DrawerItem(
                    iconPath: AppAssets.info,
                    text: AppLocalizations.of(context)!.about_us,
                    navigateTo: () => BlocProvider.of<HomeCubit>(context)
                        .navigateTo(context, Routes.aboutUsScreen))
              ],
            );
          },
        ),
      ),
    );
  }
}
