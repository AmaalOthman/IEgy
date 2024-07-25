import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iegy/core/functions/show_default_dialog.dart';
import 'package:iegy/core/functions/show_default_loading_indicator.dart';
import 'package:iegy/core/routes/app_routes.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/functions/common_methods.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_text_form_field.dart';
import 'package:iegy/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:iegy/features/auth/presentation/cubit/auth_cubit/auth_state.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 55.w),
                child: SingleChildScrollView(child:
                    BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                  return Form(
                      key: cubit.registerKey,
                      child: BlocListener<AuthCubit, AuthState>(
                          child: Column(children: [
                            Text(AppLocalizations.of(context)!.create_new_acc,
                                style:
                                    Theme.of(context).textTheme.displayLarge),
                            Gap(9.h),
                            const CustomImage(imagePath: AppAssets.register),
                            Gap(9.h),
                            CustomTextFormField(
                                controller: cubit.nameController,
                                hint: AppLocalizations.of(context)!.full_name,
                                preIcon: const Icon(Icons.account_box),
                                validator: (data) {
                                  if (data == null || data.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .nameIsRequired;
                                  }
                                  return null;
                                }),
                            Gap(16.h),
                            CustomTextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: cubit.signUpEmailController,
                                hint: AppLocalizations.of(context)!.email,
                                preIcon: const Icon(Icons.mail),
                                validator: (data) {
                                  if (!ValidationUtils.isValidEmail(data!)) {
                                    return AppLocalizations.of(context)!
                                        .please_enter_valid_email;
                                  }
                                  if (data.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .email_is_required;
                                  }
                                  return null;
                                }),
                            Gap(16.h),
                            CustomTextFormField(
                                controller: cubit.signUpPasswordController,
                                hint: AppLocalizations.of(context)!.password,
                                preIcon: const Icon(Icons.lock),
                                isObSecure: cubit.isRegisterPasswordHidden,
                                suffixIcon: cubit.registerPasswordSuffix,
                                onSuffixPressed:
                                    cubit.changeRegisterPasswordSuffixIcon,
                                validator: (data) {
                                  if (data!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .password_is_required;
                                  }
                                  return null;
                                }),
                            Gap(16.h),
                            CustomTextFormField(
                                controller:
                                    cubit.signUpPasswordConfirmationController,
                                hint: AppLocalizations.of(context)!
                                    .confirm_password,
                                preIcon: const CustomImage(
                                    imagePath: AppAssets.locker),
                                isObSecure: cubit.isRegisterPassConfirmHidden,
                                suffixIcon: cubit.registerPassConfirmSuffix,
                                onSuffixPressed:
                                    cubit.changeRegisterPassConfirmSuffixIcon,
                                validator: (data) {
                                  if (data!.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .password_confirmation_is_required;
                                  }
                                  if (data !=
                                      cubit.signUpPasswordController.text) {
                                    return AppLocalizations.of(context)!
                                        .twoPasswordsDoNotMatch;
                                  }
                                  return null;
                                }),
                            Gap(16.h),
                            CustomTextFormField(
                                controller: cubit.signUpPhoneController,
                                keyboardType: TextInputType.phone,
                                hint:
                                    AppLocalizations.of(context)!.phone_number,
                                preIcon: const Icon(Icons.call),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .phone_number_is_required;
                                  }
                                  return null;
                                }),
                            Gap(16.h),
                            CustomButton(
                                onPressed: () =>
                                    cubit.validateThenDoSignUp(context),
                                text: AppLocalizations.of(context)!.create_acc),
                            SizedBox(height: 21.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: .7,
                                  width: 120.w,
                                  color: AppColors.grey,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Column(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .login_with,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
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
                            SizedBox(height: 26.h),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomButton(
                                    w: 151,
                                    onPressed: () {},
                                    text: AppLocalizations.of(context)!.google,
                                    textColor: AppColors.blue,
                                    withIcon: true,
                                    icon: CustomImage(
                                        imagePath: AppAssets.google,
                                        w: 28.w,
                                        h: 28),
                                    background: AppColors.white,
                                  ),
                                  CustomButton(
                                      w: 151,
                                      onPressed: () {},
                                      text: AppLocalizations.of(context)!
                                          .facebook,
                                      withIcon: true,
                                      icon: CustomImage(
                                        imagePath: AppAssets.facebook,
                                        w: 14.53228.w,
                                        h: 26.89956,
                                      ),
                                      background: AppColors.lightBlue)
                                ]),
                            SizedBox(height: 20.h),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      AppLocalizations.of(context)!
                                          .already_you_have_an_account,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium),
                                  TextButton(
                                      onPressed: () => navigateLast(
                                          context: context,
                                          route: Routes.login),
                                      child: Text(
                                          AppLocalizations.of(context)!.login,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: AppColors.darkBlue)))
                                ])
                          ]),
                          listener: (BuildContext context, AuthState state) {
                            if (state is RegisterLoadingState) {
                              showDefaultLoadingIndicator(context,
                                  cancelable: false);
                            }
                            if (state is RegisterErrorState) {
                              Navigator.pop(context);
                              showDefaultDialog(context,
                                  type: NotificationType.error,
                                  description: state.errorMessage);
                            }
                            if (state is RegisterSuccessState) {navigateLast(context: context, route: Routes.navBar);}}));})))));}}