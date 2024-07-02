import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/core/widgets/custom_image.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

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
                          AppLocalizations.of(context)!
                              .exchange_and_return_policy,
                          style: Theme.of(context).textTheme.displayLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center)),
                  leading: const BackArrow())
            ])),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(children: [
              SizedBox(width: double.infinity, height: 8.h),
              CustomImage(
                  imagePath: AppAssets.exchangeImage, h: 182.h, w: 246.w),
              SizedBox(height: 16.h),
              Expanded(
                  child: ListView(children: [
                Text(AppLocalizations.of(context)!.exchange_policy,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 20.h)),
                SizedBox(height: 1.h),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .product_can_be_returned_within_fourteen_days_from_the_date_of_receiving_provided_that_it_has_not_been_used_at_all_and_that_it_is_in_its_original_condition_in_terms_of_packaging_components_or_attachments_with_the_customer_bearing_the_shipping_and_packaging_expenses_in_case_of_unpacking_value_is_determined_according_to_product,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .products_can_be_returned_if_they_do_not_conform_to_the_specifications_mentioned_on_the_website_or_if_product_is_damaged_or_has_manufacturing_defects,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .product_is_ineligible_for_return_if_there_are_defects_resulting_from_misuse,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .product_can_be_returned_within_fourteen_days_from_the_date_of_receiving_provided_that_it_has_not_been_used_at_all_and_that_it_is_in_its_original_condition_in_terms_of_packaging_components_or_attachments_with_the_customer_bearing_the_shipping_and_packaging_expenses_in_case_of_unpacking_value_is_determined_according_to_product,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .products_can_be_returned_if_they_do_not_conform_to_the_specifications_mentioned_on_the_website_or_if_product_is_damaged_or_has_manufacturing_defects,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .product_is_ineligible_for_return_if_there_are_defects_resulting_from_misuse,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ]),
                SizedBox(height: 24.h),
                Text(AppLocalizations.of(context)!.refund_policy,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 20.h)),
                SizedBox(height: 1.h),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .product_can_be_returned_within_fourteen_days_from_the_date_of_receiving_provided_that_it_has_not_been_used_at_all_and_that_it_is_in_its_original_condition_in_terms_of_packaging_components_or_attachments_with_the_customer_bearing_the_shipping_and_packaging_expenses_in_case_of_unpacking_value_is_determined_according_to_product,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .products_can_be_returned_if_they_do_not_conform_to_the_specifications_mentioned_on_the_website_or_if_product_is_damaged_or_has_manufacturing_defects,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .product_is_ineligible_for_return_if_there_are_defects_resulting_from_misuse,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .product_can_be_returned_within_fourteen_days_from_the_date_of_receiving_provided_that_it_has_not_been_used_at_all_and_that_it_is_in_its_original_condition_in_terms_of_packaging_components_or_attachments_with_the_customer_bearing_the_shipping_and_packaging_expenses_in_case_of_unpacking_value_is_determined_according_to_product,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .products_can_be_returned_if_they_do_not_conform_to_the_specifications_mentioned_on_the_website_or_if_product_is_damaged_or_has_manufacturing_defects,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .product_is_ineligible_for_return_if_there_are_defects_resulting_from_misuse,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .product_can_be_returned_within_fourteen_days_from_the_date_of_receiving_provided_that_it_has_not_been_used_at_all_and_that_it_is_in_its_original_condition_in_terms_of_packaging_components_or_attachments_with_the_customer_bearing_the_shipping_and_packaging_expenses_in_case_of_unpacking_value_is_determined_according_to_product,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .products_can_be_returned_if_they_do_not_conform_to_the_specifications_mentioned_on_the_website_or_if_product_is_damaged_or_has_manufacturing_defects,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      margin: EdgeInsets.only(top: 15.h),
                      color: AppColors.darkBlue,
                      height: 5.h,
                      width: 5.w),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      width: 383.w,
                      child: Text(
                          AppLocalizations.of(context)!
                              .product_is_ineligible_for_return_if_there_are_defects_resulting_from_misuse,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 16.h,
                                  color: AppColors.darkBlue,
                                  height: 2.h)))
                ])
              ]))
            ])));
  }
}
