import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/features/nav_bar/presentation/components/nav_bar_icon.dart';
import 'package:iegy/features/nav_bar/presentation/cubit/nav_bar_cubit.dart';
import 'package:iegy/features/nav_bar/presentation/cubit/nav_bar_state.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        return Scaffold(
          body: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: BlocProvider.of<NavBarCubit>(context).controller,
            itemCount: BlocProvider.of<NavBarCubit>(context).pages.length,
            itemBuilder: (_, index) {
              return BlocProvider.of<NavBarCubit>(context).pages[
                  index % BlocProvider.of<NavBarCubit>(context).pages.length];
            },
            onPageChanged: (int index) {
              BlocProvider.of<NavBarCubit>(context).changeIndex(index);
            },
          ),
          bottomNavigationBar: SizedBox(
            height: 88.h,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(13),
                topRight: Radius.circular(13),
              ),
              child: BottomNavigationBar(
                currentIndex: BlocProvider.of<NavBarCubit>(context).currentIndex,
                onTap: (index) {
                  BlocProvider.of<NavBarCubit>(context).changeIndex(index);
                  BlocProvider.of<NavBarCubit>(context).controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                items: [
                  BottomNavigationBarItem(
                    icon: NavBarIcon(
                        BlocProvider.of<NavBarCubit>(context).currentIndex == 0,
                        AppAssets.home,
                        AppAssets.homeOutline),
                    label: AppLocalizations.of(context)!.home,
                  ),
                  BottomNavigationBarItem(
                    icon: NavBarIcon(
                        BlocProvider.of<NavBarCubit>(context).currentIndex == 1,
                        AppAssets.categories,
                        AppAssets.categoriesOutline),
                    label: AppLocalizations.of(context)!.categories,
                  ),
                  BottomNavigationBarItem(
                    icon: NavBarIcon(
                        BlocProvider.of<NavBarCubit>(context).currentIndex == 2,
                        AppAssets.cartSelected,
                        AppAssets.cart),
                    label: AppLocalizations.of(context)!.cart,
                  ),
                  BottomNavigationBarItem(
                    icon: NavBarIcon(
                        BlocProvider.of<NavBarCubit>(context).currentIndex == 3,
                        AppAssets.profile,
                        AppAssets.profileOutline),
                    label: AppLocalizations.of(context)!.profile,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}