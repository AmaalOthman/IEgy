import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/features/splash/presentation/cubit/welcome_cubit.dart';
import 'package:iegy/features/splash/presentation/cubit/welcome_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<WelcomeCubit, WelcomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 420.h,
                  width: 430.w,
                  child: PageView.builder(
                    controller:
                        BlocProvider.of<WelcomeCubit>(context).controller,
                    itemCount:
                        BlocProvider.of<WelcomeCubit>(context).pages.length,
                    itemBuilder: (_, index) {
                      return BlocProvider.of<WelcomeCubit>(context).pages[
                          index %
                              BlocProvider.of<WelcomeCubit>(context)
                                  .pages
                                  .length];
                    },
                    onPageChanged: (int index) {
                      setState(() {
                        BlocProvider.of<WelcomeCubit>(context).isFirstPage =
                            index == 0;
                      });
                    },
                  ),
                ),
                SizedBox(height: 32.h),
                CustomImage(
                  imagePath: AppAssets.appLogo,
                  h: 126.h,
                  w: 126.w,
                ),
                SizedBox(height: BlocProvider.of<WelcomeCubit>(context).isFirstPage? 66.h: 32.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Text(
                    BlocProvider.of<WelcomeCubit>(context).isFirstPage
                        ? AppLocalizations.of(context)!
                            .we_create_furniture_with_your_eyes
                        : '${AppLocalizations.of(context)!.new_home_new_furniture}\n ${AppLocalizations.of(context)!.discover_our_distinctive_collection_of_furniture_and_renew_your_home_with_a_magical_touch}',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(height: 2.h),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: BlocProvider.of<WelcomeCubit>(context).isFirstPage? 66.h: 16.h),
                SmoothPageIndicator(
                  controller: BlocProvider.of<WelcomeCubit>(context).controller,
                  count: BlocProvider.of<WelcomeCubit>(context).pages.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.darkBrown,
                    dotColor: AppColors.grey,
                    dotHeight: 6.h,
                    dotWidth: 6.w,
                    spacing: 3,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 50.h),
        child: GestureDetector(
          onTap: () => BlocProvider.of<WelcomeCubit>(context)
              .onFloatingActionButtonPressed(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                AppLocalizations.of(context)!.next,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 20.w),
              ),
              Icon(
                Icons.arrow_right_outlined,
                color: AppColors.darkBrown,
                size: 39.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
