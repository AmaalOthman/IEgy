import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/bloc/cubit/global_cubit.dart';
import 'package:iegy/core/bloc/cubit/global_state.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/features/home/presentation/components/drawer_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeSideMenu extends StatelessWidget {
  const HomeSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    bool isEnglish = currentLocale.languageCode == 'en';
    return Scaffold(
      appBar: AppBar(
        title: const CustomImage(
          imagePath: AppAssets.homeLogo,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        child: ListView(
          children: [
            DrawerItem(
                iconPath: AppAssets.location,
                text: AppLocalizations.of(context)!.our_branches,
                onTap: () {}),
            BlocBuilder<GlobalCubit, GlobalState>(
              builder: (context, state) {
                return DrawerItem(
                    iconPath: AppAssets.glob,
                    text: isEnglish ? 'العربية' : 'English',
                    onTap: () {
                      BlocProvider.of<GlobalCubit>(context).switchLanguage();
                    });
              },
            ),
            DrawerItem(
                iconPath: AppAssets.order,
                text: AppLocalizations.of(context)!.orders_and_tracking,
                onTap: () {}),
            DrawerItem(
                iconPath: AppAssets.heart,
                text: AppLocalizations.of(context)!.favourites,
                onTap: () {}),
            DrawerItem(
                iconPath: AppAssets.darkMood,
                text: AppLocalizations.of(context)!.dark_mode,
                onTap: () {}),
            DrawerItem(
                iconPath: AppAssets.exchange,
                text: AppLocalizations.of(context)!.exchange_and_return_policy,
                onTap: () {}),
            DrawerItem(
                iconPath: AppAssets.hummer,
                text: AppLocalizations.of(context)!.supply_and_installation,
                onTap: () {}),
            DrawerItem(
                iconPath: AppAssets.info,
                text: AppLocalizations.of(context)!.about_us,
                onTap: () {})
          ],
        ),
      ),
    );
  }
}
