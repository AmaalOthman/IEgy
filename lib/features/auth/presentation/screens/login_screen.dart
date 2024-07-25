import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/routes/app_routes.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/functions/common_methods.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';
import 'package:iegy/core/widgets/custom_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:iegy/features/auth/presentation/cubit/auth_cubit/auth_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<AuthCubit>(context).removeKeyboard(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 55.w, vertical: 32.h),
            child: SingleChildScrollView(
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    showToast(
                        message:
                            AppLocalizations.of(context)!.login_successfully,
                        state: ToastStates.success);
                    navigateLast(context: context, route: Routes.navBar);
                  }
                  if (state is LoginErrorState) {
                    showToast(message: state.message, state: ToastStates.error);
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: BlocProvider.of<AuthCubit>(context).loginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.login,
                          style: Theme.of(context).textTheme.displayLarge
                        ),
                        SizedBox(
                          height: 29.h
                        ),
                        CustomImage(
                          imagePath: AppAssets.login,
                          h: 188.h,
                          w: 204.02.w
                        ),
                        SizedBox(
                          height: 24.h
                        ),
                        CustomTextFormField(
                            focusNode: BlocProvider.of<AuthCubit>(context)
                                .emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            controller: BlocProvider.of<AuthCubit>(context)
                                .loginEmailController,
                            hint: AppLocalizations.of(context)!.email,
                            preIcon: Padding(
                              padding: EdgeInsets.all(17.w),
                              child: const CustomImage(
                                imagePath: AppAssets.email
                              )
                            ),
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
                        SizedBox(
                          height: 16.h
                        ),
                        CustomTextFormField(
                          focusNode: BlocProvider.of<AuthCubit>(context)
                              .passwordFocusNode,
                          controller: BlocProvider.of<AuthCubit>(context)
                              .loginPasswordController,
                          hint: AppLocalizations.of(context)!.password,
                          preIcon: Padding(
                              padding: EdgeInsets.all(17.w),
                              child: CustomImage(
                                imagePath: AppAssets.locker,
                                h: 16.h,
                                w: 14.w,
                              )),
                          isObSecure: BlocProvider.of<AuthCubit>(context)
                              .isLoginPasswordHidden,
                          suffixIcon:
                              BlocProvider.of<AuthCubit>(context).suffixIcon,
                          onSuffixPressed: BlocProvider.of<AuthCubit>(context)
                              .changeLoginPasswordSuffixIcon,
                          validator: (data) {
                            if (data!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .password_is_required;
                            }
                            return null;
                          }
                        ),
                        SizedBox(
                          height: 16.h
                        ),
                        state is LoginLoadingState
                            ? const CustomLoadingIndicator()
                            : CustomButton(
                                onPressed: () =>
                                    BlocProvider.of<AuthCubit>(context)
                                        .onLoginPressed(context),
                                text: AppLocalizations.of(context)!.login),
                        SizedBox(
                          height: 4.h
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () => BlocProvider.of<AuthCubit>(context)
                                  .onForgetPasswordPressed(context),
                              child: Text(
                                AppLocalizations.of(context)!.forgot_password,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      decoration: TextDecoration.underline
                                    )
                              )
                            )
                          ]
                        ),
                        SizedBox(
                          height: 48.h
                        ),
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
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              child: Column(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.login_with,
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
                              color: AppColors.grey
                            )
                          ]
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  h: 28.h),
                              background: AppColors.white,
                            ),
                            CustomButton(
                              w: 151,
                              onPressed: () {
                                navigateLast(
                                    context: context, route: Routes.navBar);
                              },
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
                        InkWell(
                          onTap: () => BlocProvider.of<AuthCubit>(context)
                              .onRegisterPressed(context),
                          child: Text(
                            AppLocalizations.of(context)!.create_new_acc,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontSize: 16.w, color: AppColors.darkBlue),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
