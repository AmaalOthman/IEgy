import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:iegy/core/database/cache/cache_helper.dart';
import 'package:iegy/core/services/service_locator.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/features/home/presentation/components/home_category.dart';
import 'package:iegy/features/home/presentation/components/offer.dart';
import 'package:iegy/features/home/presentation/components/idea.dart';
import 'package:iegy/features/home/presentation/components/sale.dart';
import 'package:iegy/features/home/presentation/components/section_title.dart';
import 'package:iegy/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/home_cubit/home_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iegy/features/home/presentation/screens/home_side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            if (BlocProvider.of<HomeCubit>(context).focusNode.hasFocus) {
              BlocProvider.of<HomeCubit>(context).focusNode.unfocus();
              return false;
            } else {
              return true;
            }
          },
          child: Scaffold(
              drawer: Drawer(
                width: 270.w,
                child: const HomeSideMenu(),
              ),
              appBar: BlocProvider.of<HomeCubit>(context).focusNode.hasFocus
                  ? null
                  : AppBar(
                      title: CustomImage(
                        h: 40.h,
                        w: 95.w,
                        imagePath: AppAssets.homeLogo,
                      ),
                      actions: [
                        GestureDetector(
                          onTap: () => BlocProvider.of<HomeCubit>(context)
                              .goToNotifications(context),
                          child: CustomImage(
                            imagePath: AppAssets.notifications,
                            h: 22.4.h,
                            w: 19.6.w,
                          ),
                        ),
                        SizedBox(
                          width: 13.w,
                        )
                      ],
                    ),
              body: Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16.w,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  width: 350.w,
                                  child: CustomTextFormField(
                                    controller: TextEditingController(
                                        text:
                                            BlocProvider.of<HomeCubit>(context)
                                                    .speechToText
                                                    .isListening
                                                ? "listening.."
                                                : BlocProvider.of<HomeCubit>(
                                                        context)
                                                    .spokenWords),
                                    focusNode:
                                        BlocProvider.of<HomeCubit>(context)
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
                                        BlocProvider.of<HomeCubit>(context)
                                            .onVoiceSearchClicked,
                                  )),
                              SizedBox(width: 20.w),
                              GestureDetector(
                                onTap: () => BlocProvider.of<HomeCubit>(context).onFilterPressed(context),
                                child: CustomImage(
                                  imagePath: AppAssets.filter,
                                  w: 18.67.w,
                                ),
                              ),
                              SizedBox(width: 16.w)
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          if (!BlocProvider.of<HomeCubit>(context)
                              .focusNode
                              .hasFocus)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(16.w),
                                  width: 398.w,
                                  height: 203.h,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.black.withOpacity(0.15),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xffe8e3da),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 106.w,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            RichText(
                                              // maxLines: 2,
                                              overflow: TextOverflow.fade,
                                              text: TextSpan(
                                                text: AppLocalizations.of(
                                                        context)!
                                                    .here_we_make_u_fall_in_love_with_the_place_u_live_in,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium!
                                                    .copyWith(
                                                      height: 2.h,
                                                    ),
                                              ),
                                            ),
                                            CustomButton(
                                              h: 22.h,
                                              onPressed: () {},
                                              text:
                                                  AppLocalizations.of(context)!
                                                      .contact_us,
                                              fontSize: 10.w,
                                            )
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      const CustomImage(
                                          imagePath: AppAssets.home1st)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                SizedBox(
                                  width: 414.w,
                                  height: 50.h,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      HomeCategory(
                                        first: true,
                                        icon: AppAssets.shuffle,
                                        label: '',
                                      ),
                                      HomeCategory(
                                          icon: AppAssets.chair,
                                          label: AppLocalizations.of(context)!
                                              .chairs),
                                      HomeCategory(
                                          icon: AppAssets.table,
                                          label: AppLocalizations.of(context)!
                                              .tables),
                                      HomeCategory(
                                          icon: AppAssets.sofa,
                                          label: AppLocalizations.of(context)!
                                              .sofas),
                                      HomeCategory(
                                          icon: AppAssets.sofra,
                                          label: AppLocalizations.of(context)!
                                              .sofra),
                                      HomeCategory(
                                          icon: AppAssets.door,
                                          label: AppLocalizations.of(context)!
                                              .doors),
                                      HomeCategory(
                                          icon: AppAssets.bed,
                                          label: AppLocalizations.of(context)!
                                              .bed_rooms),
                                      HomeCategory(
                                          icon: AppAssets.kitchen,
                                          label: AppLocalizations.of(context)!
                                              .kitchens),
                                      HomeCategory(
                                          icon: AppAssets.tv,
                                          label: AppLocalizations.of(context)!
                                              .tv_units),
                                      HomeCategory(
                                          icon: AppAssets.shoesCabinet,
                                          label: AppLocalizations.of(context)!
                                              .shoes_cabinets),
                                      HomeCategory(
                                          icon: AppAssets.dressingRoom,
                                          label: AppLocalizations.of(context)!
                                              .dressing_room)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 17.h,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.offers,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(color: AppColors.brown),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                SizedBox(
                                  height: 190.h,
                                  width: 414.w,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return const Offer();
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(width: 8.w);
                                    },
                                    itemCount: 32,
                                  ),
                                ),
                                SizedBox(height: 21.h),
                                SectionTitle(
                                    title: AppLocalizations.of(context)!
                                        .best_seller),
                                SizedBox(
                                  height: 12.h,
                                ),
                                SizedBox(
                                  height: 251.h,
                                  width: 414.w,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return const Sale();
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(width: 16.w);
                                    },
                                    itemCount: 32,
                                  ),
                                ),
                                SizedBox(height: 21.h),
                                SectionTitle(
                                    title: AppLocalizations.of(context)!
                                        .room_ideas),
                                SizedBox(
                                  height: 12.h,
                                ),
                                SizedBox(
                                  height: 154.h,
                                  width: 414.w,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return const Idea();
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(width: 16.w);
                                    },
                                    itemCount: 32,
                                  ),
                                ),
                                SizedBox(height: 21.h),
                                SectionTitle(
                                    title: AppLocalizations.of(context)!
                                        .kitchen_collections),
                                SizedBox(
                                  height: 12.h,
                                ),
                                SizedBox(
                                  height: 154.h,
                                  width: 414.w,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return const Idea();
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(width: 16.w);
                                    },
                                    itemCount: 32,
                                  ),
                                )
                              ],
                            )
                          else
                            Column(
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .search_history,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(fontSize: 17),
                                    ),
                                    SizedBox(
                                      width: sl<CacheHelper>()
                                                  .getCachedLanguage() ==
                                              'ar'
                                          ? 230.w
                                          : 295.w,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.no_history_yet,
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                SizedBox(
                                  height: 36.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.popular,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(fontSize: 17),
                                    ),
                                    SizedBox(
                                      width: 350.w,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Row(
                                  children: [
                                    CustomButton(
                                        onPressed: () {},
                                        text: AppLocalizations.of(context)!
                                            .tables,
                                        borderRadius: 15,
                                        background: AppColors.brown,
                                        w: 120.w),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    CustomButton(
                                        onPressed: () {},
                                        text:
                                            AppLocalizations.of(context)!.sofa,
                                        borderRadius: 15,
                                        background: AppColors.brown,
                                        w: 120.w),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    CustomButton(
                                        onPressed: () {},
                                        text: AppLocalizations.of(context)!
                                            .corner,
                                        borderRadius: 15,
                                        background: AppColors.brown,
                                        w: 120.w)
                                  ],
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Row(
                                  children: [
                                    CustomButton(
                                        onPressed: () {},
                                        text:
                                            AppLocalizations.of(context)!.doors,
                                        borderRadius: 15,
                                        background: AppColors.brown,
                                        w: 120.w),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    CustomButton(
                                        onPressed: () {},
                                        text: AppLocalizations.of(context)!
                                            .tv_units,
                                        borderRadius: 15,
                                        background: AppColors.brown,
                                        w: sl<CacheHelper>()
                                                    .getCachedLanguage() ==
                                                'ar'
                                            ? 175.w
                                            : 135.w),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    CustomButton(
                                        onPressed: () {},
                                        text: AppLocalizations.of(context)!
                                            .dressing,
                                        borderRadius: 15,
                                        background: AppColors.brown,
                                        w: sl<CacheHelper>()
                                                    .getCachedLanguage() ==
                                                'ar'
                                            ? 120.w
                                            : 130.w)
                                  ],
                                )
                              ],
                            )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startFloat,
              floatingActionButton: SpeedDial(
                overlayOpacity: 0,
                iconTheme: const IconThemeData(color: AppColors.white),
                backgroundColor: AppColors.darkBrown,
                activeChild: const Icon(
                  CupertinoIcons.xmark,
                  color: AppColors.darkBlue,
                ),
                activeBackgroundColor: AppColors.white,
                icon: Icons.phone_enabled,
                children: [
                  SpeedDialChild(
                      shape: const CircleBorder(),
                      backgroundColor: AppColors.darkBrown,
                      onTap: () =>
                          BlocProvider.of<HomeCubit>(context).dialPhoneNumber(),
                      child: const Icon(Icons.phone_enabled,
                          color: AppColors.white)),
                  SpeedDialChild(
                    shape: const CircleBorder(),
                    backgroundColor: AppColors.darkBrown,
                    onTap: () =>
                        BlocProvider.of<HomeCubit>(context).openFacebookPage(),
                    child: const Icon(
                      Icons.facebook,
                      color: AppColors.white,
                    ),
                  ),
                  SpeedDialChild(
                      shape: const CircleBorder(),
                      backgroundColor: AppColors.darkBrown,
                      onTap: () => BlocProvider.of<HomeCubit>(context)
                          .onWhatsAppPressed(),
                      child: const Icon(FontAwesomeIcons.whatsapp,
                          color: AppColors.white))
                ],
              )),
        );
      },
    ));
  }
}