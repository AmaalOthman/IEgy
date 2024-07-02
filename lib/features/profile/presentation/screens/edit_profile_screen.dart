import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/utils/common_methods.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';
import 'package:iegy/core/widgets/custom_text_form_field.dart';
import 'package:iegy/features/profile/presentation/cubit/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:iegy/features/profile/presentation/cubit/edit_profile_cubit/edit_profile_state.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 84.h),
            child: Column(
              children: [
                const Spacer(),
                AppBar(
                  title: Text(
                    AppLocalizations.of(context)!.edit_profile,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  leading: IconButton(
                    onPressed: () => BlocProvider.of<EditProfileCubit>(context)
                        .goBack(context),
                    icon: const BackArrow(),
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
              padding: EdgeInsets.symmetric(vertical: 62.h, horizontal: 15.w),
              child: SingleChildScrollView(
                  child: Column(children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.15),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 3),
                            ),
                          ], shape: BoxShape.circle),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            height: 102.h,
                            width: 102.w,
                            imageUrl:
                                'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
                            errorWidget: (context, url, error) =>
                                const CustomImage(
                                    imagePath: AppAssets.errorImage),
                            progressIndicatorBuilder:
                                (context, url, progress) => SizedBox(
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
                        Positioned(
                          bottom: 16.h,
                          right: isArabic() ? 0 : 69.w,
                          child: InkWell(
                            onTap: () =>
                                BlocProvider.of<EditProfileCubit>(context)
                                    .showChangePicBottomSheet(context),
                            child: Container(
                                height: 33.h,
                                width: 33.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.brown),
                                    color: AppColors.white),
                                padding: EdgeInsets.all(6.6.w),
                                child: const CustomImage(
                                    imagePath: AppAssets.changePP)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 41.w,
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
                  ],
                ),
                SizedBox(height: 83.h),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      height: 48.h,
                      width: 398.w,
                      padding: EdgeInsets.all(12.w),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.name,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontSize: 16.h, color: AppColors.darkBlue),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomTextFormField(
                            w: 303.w,
                            initialValue: 'Ali Ahmed',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 16.h),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 12.h,
                        right: isArabic() ? 71.w : 325.w,
                        child: Container(
                          height: 25.h,
                          width: 2.w,
                          color: AppColors.grey,
                        ))
                  ],
                ),
                SizedBox(height: 24.h),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      height: 48.h,
                      width: 398.w,
                      padding: EdgeInsets.all(12.w),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.email_ii,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontSize: 16.h, color: AppColors.darkBlue),
                          ),
                          SizedBox(
                            width: 17.w,
                          ),
                          CustomTextFormField(
                            w: 303.w,
                            initialValue: 'aliahmed@gmail.com',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 16.h),
                            keyboardType: TextInputType.emailAddress,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 12.h,
                        right: isArabic() ? 71.w : 325.w,
                        child: Container(
                          height: 25.h,
                          width: 2.w,
                          color: AppColors.grey,
                        ))
                  ],
                ),
                SizedBox(height: 24.h),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      height: 48.h,
                      width: 398.w,
                      padding: EdgeInsets.all(12.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.phone,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontSize: 16.h, color: AppColors.darkBlue),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          CustomTextFormField(
                            w: 303.w,
                            initialValue: '01015151655',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 16.h),
                            keyboardType: TextInputType.phone,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 12.h,
                        right: isArabic() ? 71.w : 325.w,
                        child: Container(
                          height: 25.h,
                          width: 2.w,
                          color: AppColors.grey,
                        ))
                  ],
                ),
                SizedBox(height: 24.h),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      height: 77.h,
                      width: 398.w,
                      padding: EdgeInsets.all(12.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.address,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontSize: 16.h, color: AppColors.darkBlue),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          CustomTextFormField(
                            w: 303.w,
                            initialValue: 'شارع النحاس - طنطا - الغربية',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 16.h),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 12.h,
                        right: isArabic() ? 71.w : 325.w,
                        child: Container(
                          height: 47.h,
                          width: 2.w,
                          color: AppColors.grey,
                        ))
                  ],
                ),
                SizedBox(height: 84.h),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                          onPressed: ()  =>
                              BlocProvider.of<EditProfileCubit>(context)
                                  .save(context),
                          text: AppLocalizations.of(context)!.save,
                          h: 48.h,
                          w: 191,
                          elevation: 5),
                      CustomButton(
                          onPressed: () =>
                              BlocProvider.of<EditProfileCubit>(context)
                                  .cancel(context),
                          text: AppLocalizations.of(context)!.cancel,
                          h: 48.h,
                          w: 191,
                          background: AppColors.white,
                          elevation: 5,
                          textStyle: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppColors.black, fontSize: 16.h))
                    ])
              ]))));
    });
  }
}