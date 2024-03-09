import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/utils/common_methods.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/core/widgets/custom_text_form_field.dart';
import 'package:iegy/features/auth/presentation/cubit/reset_password_navigator_cubit/reset_password_navigator_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomImage(imagePath: AppAssets.forgetPassword),
            SmoothPageIndicator(
              controller: BlocProvider.of<ResetPasswordNavigatorCubit>(context).controller,
              count: BlocProvider.of<ResetPasswordNavigatorCubit>(context).pages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.darkBrown,
                dotColor: AppColors.grey,
                dotHeight: 6.h,
                dotWidth: 6.w,
                spacing: 3,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.forgot_password,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              AppLocalizations.of(context)!.enter_your_email_or_phone_number,
            ),
            CustomTextFormField(
              keyboardType: TextInputType.emailAddress,
              // controller: BlocProvider.of<ForgetPasswordCubit>(context).emailController,
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
              },
            ),
            CustomButton(
              onPressed: (){},
              text: AppLocalizations.of(context)!.reset_password,
            )
          ],
        ),
      ),
    );
  }
}