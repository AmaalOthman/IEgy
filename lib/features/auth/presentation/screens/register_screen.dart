import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/utils/common_methods.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 55.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.create_new_acc,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  //SizedBox(height: 4 .h,),
                  const CustomImage(imagePath: AppAssets.register),
                  //SizedBox(height: 4 .h,),
                  CustomTextFormField(
                    hint: AppLocalizations.of(context)!.full_name,
                    preIcon: const Icon(Icons.account_box),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    hint: AppLocalizations.of(context)!.email,
                    preIcon: const Icon(Icons.mail),
                    validator: (data) {
                      if (!ValidationUtils.isValidEmail(data!)) {
                        return AppLocalizations.of(context)!
                            .please_enter_valid_email;
                      }
                      if (data!.isEmpty) {
                        return AppLocalizations.of(context)!.email_is_required;
                      }
                      return null;
                    }
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    hint: AppLocalizations.of(context)!.password,
                    preIcon: const Icon(Icons.lock),
                    isObSecure: true,
                    suffixIcon: const Icon(Icons.visibility),
                    onSuffixPressed: () {},
                    validator: (data) {
                      if (data!.isEmpty) {
                        return AppLocalizations.of(context)!
                            .password_is_required;
                      }
                      return null;
                    }
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    hint: AppLocalizations.of(context)!.confirm_password,
                    preIcon: const CustomImage(imagePath: AppAssets.locker),
                    isObSecure: true,
                    suffixIcon: const Icon(Icons.visibility),
                    onSuffixPressed: () {},
                    validator: (data) {
                      if (data!.isEmpty) {
                        return AppLocalizations.of(context)!
                            .password_is_required;
                      }
                      return null;
                    }),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    keyboardType: const TextInputType.numberWithOptions(),
                    hint: AppLocalizations.of(context)!.phone_number,
                    preIcon: const Icon(Icons.call),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomButton(
                    onPressed: () {},
                    text: AppLocalizations.of(context)!.create_acc,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: .7,
                        width: 120.w,
                        color: AppColors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.login_with,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            SizedBox(
                              height: 11.h,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: .7,
                        width: 120.w,
                        color: AppColors.grey,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        w: 151.w,
                        onPressed: () {},
                        text: AppLocalizations.of(context)!.google,
                        textColor: AppColors.blue,
                        withIcon: true,
                        icon: CustomImage(
                            imagePath: AppAssets.google, w: 28.w, h: 28.h),
                        background: AppColors.white,
                      ),
                      CustomButton(
                        w: 151.w,
                        onPressed: () {},
                        text: AppLocalizations.of(context)!.facebook,
                        withIcon: true,
                        icon: CustomImage(
                          imagePath: AppAssets.facebook,
                          w: 14.53228.w,
                          h: 26.89956,
                        ),
                        background: AppColors.lightBlue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!
                            .already_you_have_an_account,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text(
                        AppLocalizations.of(context)!.login,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                            fontSize: 16.w, color: AppColors.darkBlue),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}