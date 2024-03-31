import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_text_form_field.dart';
import 'package:iegy/features/home/presentation/components/region.dart';
import 'package:iegy/features/home/presentation/cubit/supply_and_installation_cubit/supply_and_installation_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/supply_and_installation_cubit/supply_and_installation_state.dart';

class SupplyAndInstallationScreen extends StatelessWidget {
  const SupplyAndInstallationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 87.h),
            child: Column(children: [
              const Spacer(),
              AppBar(
                  title: SizedBox(
                      width: 181.w,
                      child: Text(
                        AppLocalizations.of(context)!.supply_and_installation,
                        style: Theme.of(context).textTheme.displayLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      )),
                  leading: const BackArrow())
            ])),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(children: [
              const SizedBox(width: double.infinity),
              CustomImage(
                  imagePath: AppAssets.installation, h: 208.h, w: 329.w),
              SizedBox(height: 16.h),
              Expanded(
                  child: ListView(children: [
                Text(AppLocalizations.of(context)!.shipping_cost,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 20.h)),
                SizedBox(height: 16.h),
                BlocBuilder<SupplyAndInstallationCubit,
                    SupplyAndInstallationState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap:
                              BlocProvider.of<SupplyAndInstallationCubit>(context)
                                  .showOrHideRegions,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.lightBrown,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(0, 3),
                                    )
                                  ]),
                              padding: EdgeInsets.all(16.h),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!.select_region,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                color: AppColors.white,
                                                fontSize: 16.h)),
                                    if (state is! ShowRegionsState)
                                      CustomImage(
                                          imagePath: AppAssets.arrowUpDownII,
                                          h: 24.h,
                                          w: 24.w),
                                    if (state is ShowRegionsState)
                                      CustomImage(
                                          imagePath: AppAssets.arrowUp,
                                          h: 24.h,
                                          w: 24.w)
                                  ])),
                        ),
                       if(state is !ShowRegionsState) SizedBox(height: 6.h),
                       if(state is ShowRegionsState) Container(
                         height: 313.h,
                         margin: EdgeInsets.symmetric(vertical: 16.h),
                         decoration: BoxDecoration(
                           color: AppColors.lightBrown,
                           borderRadius: BorderRadius.circular(25),
                             boxShadow: [
                               BoxShadow(
                                 color: AppColors.black.withOpacity(0.2),
                                 spreadRadius: 2,
                                 blurRadius: 2,
                                 offset: const Offset(0, 3),
                               )
                             ]
                         ),
                         padding: EdgeInsets.only(top: 16.h, bottom: 8.h, left: 14.w, right: 14.w),
                         child: Column(
                           children: [
                             CustomTextFormField(
                               shadow: true,
                               hint: AppLocalizations.of(context)!.write_region,
                               preIcon: const Icon(Icons.search, color: AppColors.darkBrown)
                             ),
                             SizedBox(height: 8.h),
                             Expanded(child: ListView(
                               children: [
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000),
                                 Region(region: AppLocalizations.of(context)!.ismaeilia, price: 2000)
                               ],
                             ))
                           ]
                         )
                       )
                      ]
                    );
                  }
                ),
                    Text(AppLocalizations.of(context)!.terms_and_conditions,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 20.h)),
                    SizedBox(height: 1.h),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.product_can_be_returned_within_fourteen_days_from_the_date_of_receiving_provided_that_it_has_not_been_used_at_all_and_that_it_is_in_its_original_condition_in_terms_of_packaging_components_or_attachments_with_the_customer_bearing_the_shipping_and_packaging_expenses_in_case_of_unpacking_value_is_determined_according_to_product,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.products_can_be_returned_if_they_do_not_conform_to_the_specifications_mentioned_on_the_website_or_if_product_is_damaged_or_has_manufacturing_defects,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.product_is_ineligible_for_return_if_there_are_defects_resulting_from_misuse,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.product_can_be_returned_within_fourteen_days_from_the_date_of_receiving_provided_that_it_has_not_been_used_at_all_and_that_it_is_in_its_original_condition_in_terms_of_packaging_components_or_attachments_with_the_customer_bearing_the_shipping_and_packaging_expenses_in_case_of_unpacking_value_is_determined_according_to_product,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.products_can_be_returned_if_they_do_not_conform_to_the_specifications_mentioned_on_the_website_or_if_product_is_damaged_or_has_manufacturing_defects,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.product_is_ineligible_for_return_if_there_are_defects_resulting_from_misuse,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    ),
                    SizedBox(height: 24.h),
                    Text(AppLocalizations.of(context)!.shipping,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 20.h)),
                    SizedBox(height: 1.h),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.product_can_be_returned_within_fourteen_days_from_the_date_of_receiving_provided_that_it_has_not_been_used_at_all_and_that_it_is_in_its_original_condition_in_terms_of_packaging_components_or_attachments_with_the_customer_bearing_the_shipping_and_packaging_expenses_in_case_of_unpacking_value_is_determined_according_to_product,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.products_can_be_returned_if_they_do_not_conform_to_the_specifications_mentioned_on_the_website_or_if_product_is_damaged_or_has_manufacturing_defects,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.product_is_ineligible_for_return_if_there_are_defects_resulting_from_misuse,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.product_can_be_returned_within_fourteen_days_from_the_date_of_receiving_provided_that_it_has_not_been_used_at_all_and_that_it_is_in_its_original_condition_in_terms_of_packaging_components_or_attachments_with_the_customer_bearing_the_shipping_and_packaging_expenses_in_case_of_unpacking_value_is_determined_according_to_product,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.products_can_be_returned_if_they_do_not_conform_to_the_specifications_mentioned_on_the_website_or_if_product_is_damaged_or_has_manufacturing_defects,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.product_is_ineligible_for_return_if_there_are_defects_resulting_from_misuse,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.product_can_be_returned_within_fourteen_days_from_the_date_of_receiving_provided_that_it_has_not_been_used_at_all_and_that_it_is_in_its_original_condition_in_terms_of_packaging_components_or_attachments_with_the_customer_bearing_the_shipping_and_packaging_expenses_in_case_of_unpacking_value_is_determined_according_to_product,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.products_can_be_returned_if_they_do_not_conform_to_the_specifications_mentioned_on_the_website_or_if_product_is_damaged_or_has_manufacturing_defects,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 15.h),
                              color: AppColors.darkBlue,
                              height: 5.h,
                              width: 5.w
                          ),
                          SizedBox(width: 10.w,),
                          SizedBox(
                              width: 383.w,
                              child: Text(
                                  AppLocalizations.of(context)!.product_is_ineligible_for_return_if_there_are_defects_resulting_from_misuse,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 20,
                                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 16.h, color: AppColors.darkBlue, height: 2.h)
                              )
                          )
                        ]
                    )
              ]))
            ])));
  }
}
