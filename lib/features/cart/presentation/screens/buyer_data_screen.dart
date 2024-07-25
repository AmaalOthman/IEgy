import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/functions/common_methods.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/page_indicator.dart';
import 'package:iegy/features/cart/presentation/components/data_input_field.dart';
import 'package:iegy/features/cart/presentation/cubit/payment_cubit/payment_cubit.dart';
import 'package:iegy/features/cart/presentation/cubit/payment_cubit/payment_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuyerDataScreen extends StatelessWidget {
  const BuyerDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return InkWell(
              onTap: () => BlocProvider.of<PaymentCubit>(context).unfocusAll(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PageIndicator(selected: true),
                      PageIndicator(selected: false),
                      PageIndicator(selected: false),
                      PageIndicator(selected: false)
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                      '${BlocProvider.of<PaymentCubit>(context).currentPhase + 1}/${BlocProvider.of<PaymentCubit>(context).phases.length}'),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DataInputField(
                        focusNode: BlocProvider.of<PaymentCubit>(context)
                            .firstNameFocusNode,
                        h: 58,
                        w: 190.w,
                        hint: AppLocalizations.of(context)!.first_name,
                      ),
                      DataInputField(
                        focusNode: BlocProvider.of<PaymentCubit>(context)
                            .lastNameFocusNode,
                        h: 58,
                        w: 190.w,
                        hint: AppLocalizations.of(context)!.last_name,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  if (state is! ShowLocationsState)
                    GestureDetector(
                      onTap: () => state is! ShowLocationsState
                          ? BlocProvider.of<PaymentCubit>(context)
                              .showLocations()
                          : null,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: AppColors.semiPrimary)),
                            width: double.infinity,
                            height: 56.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 20.h),
                          ),
                          Positioned(
                            right: 16.w,
                            top: 20.h,
                            child: Row(
                              children: [
                                Text(AppLocalizations.of(context)!.location,
                                    style: GoogleFonts.ibmPlexSansArabic(
                                        color: AppColors.grey,
                                        fontSize: 14.w,
                                        fontWeight: FontWeight.normal)),
                                SizedBox(
                                  width: isArabic() ? 313.91.w : 288.91.w,
                                ),
                                CustomImage(
                                    imagePath: AppAssets.arrowDown,
                                    h: 14.h,
                                    w: 8.24.w),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  if (state is ShowLocationsState)
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.semiPrimary)),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 20.h),
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text(AppLocalizations.of(context)!.cairo,
                                    style: dataStyle.copyWith(
                                        color: AppColors.brown)),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Text(AppLocalizations.of(context)!.giza,
                                    style: dataStyle.copyWith(
                                        color: AppColors.brown)),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Text(AppLocalizations.of(context)!.qalubia,
                                    style: dataStyle.copyWith(
                                        color: AppColors.brown)),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Text(AppLocalizations.of(context)!.sharkia,
                                    style: dataStyle.copyWith(
                                        color: AppColors.brown)),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Text(AppLocalizations.of(context)!.luxor,
                                    style: dataStyle.copyWith(
                                        color: AppColors.brown))
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 16.w,
                          top: 20.h,
                          child: Row(
                            children: [
                              Text(AppLocalizations.of(context)!.location,
                                  style: GoogleFonts.ibmPlexSansArabic(
                                      color: AppColors.grey,
                                      fontSize: 14.w,
                                      fontWeight: FontWeight.normal)),
                              SizedBox(
                                width: isArabic() ? 313.91.w : 288.91.w,
                              ),
                              Transform(
                                transform:
                                    Matrix4.rotationZ(180 * 3.1415927 / 180),
                                child: InkWell(
                                  onTap: () =>
                                      BlocProvider.of<PaymentCubit>(context)
                                          .unfocusAll(),
                                  child: CustomImage(
                                      imagePath: AppAssets.arrowDown,
                                      h: 14.h,
                                      w: 8.24.w),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  SizedBox(
                    height: 22.h,
                  ),
                  DataInputField(
                    focusNode:
                        BlocProvider.of<PaymentCubit>(context).addressFocusNode,
                    hint: AppLocalizations.of(context)!.address,
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  DataInputField(
                    focusNode: BlocProvider.of<PaymentCubit>(context)
                        .phoneNumberFocusNode,
                    hint: AppLocalizations.of(context)!.phone_number,
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  if (state is! ShowServiceTypesState)
                    GestureDetector(
                      onTap: () => state is! ShowServiceTypesState
                          ? BlocProvider.of<PaymentCubit>(context)
                              .showServiceTypes()
                          : null,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: AppColors.semiPrimary)),
                            width: double.infinity,
                            height: 56.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 20.h),
                          ),
                          Positioned(
                            right: 16.w,
                            top: 20.h,
                            child: Row(
                              children: [
                                Text(AppLocalizations.of(context)!.service_type,
                                    style: GoogleFonts.ibmPlexSansArabic(
                                        color: AppColors.grey,
                                        fontSize: 14.w,
                                        fontWeight: FontWeight.normal)),
                                SizedBox(
                                  width: isArabic() ? 288.91.w : 265.91.w,
                                ),
                                CustomImage(
                                    imagePath: AppAssets.arrowDown,
                                    h: 14.h,
                                    w: 8.24.w),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  if (state is ShowServiceTypesState)
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.semiPrimary)),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 20.h),
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text(
                                    AppLocalizations.of(context)!.delivery_only,
                                    style: dataStyle.copyWith(
                                        color: AppColors.brown)),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Text(
                                    AppLocalizations.of(context)!
                                        .delivery_and_installation,
                                    style: dataStyle.copyWith(
                                        color: AppColors.brown)),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Text(
                                    AppLocalizations.of(context)!
                                        .purchasing_in_site,
                                    style: dataStyle.copyWith(
                                        color: AppColors.brown))
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 16.w,
                          top: 20.h,
                          child: Row(
                            children: [
                              Text(AppLocalizations.of(context)!.service_type,
                                  style: GoogleFonts.ibmPlexSansArabic(
                                      color: AppColors.grey,
                                      fontSize: 14.w,
                                      fontWeight: FontWeight.normal)),
                              SizedBox(
                                width: isArabic() ? 288.91.w : 265.91.w,
                              ),
                              Transform(
                                transform:
                                    Matrix4.rotationZ(180 * 3.1415927 / 180),
                                child: InkWell(
                                  onTap: () =>
                                      BlocProvider.of<PaymentCubit>(context)
                                          .unfocusAll(),
                                  child: CustomImage(
                                      imagePath: AppAssets.arrowDown,
                                      h: 14.h,
                                      w: 8.24.w),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      CustomImage(
                          imagePath: AppAssets.securityAndPrivacy,
                          w: 19.w,
                          h: 19.h),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        AppLocalizations.of(context)!.security_and_privacy,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 12.w),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                      width: 328.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .we_maintain_industry_standard_physical_and_administrative_measures_to_protect_your_personal_information,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 12.w))),
                  SizedBox(height: 126.h)
                ],
              ));
        });
  }
}
