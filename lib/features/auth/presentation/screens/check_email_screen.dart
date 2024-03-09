import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/features/auth/presentation/cubit/reset_password_navigator_cubit/reset_password_navigator_cubit.dart';
import 'package:pinput/pinput.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CheckEmailScreen extends StatelessWidget {
  CheckEmailScreen({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const CustomImage(imagePath: AppAssets.checkMail),
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
              SizedBox(
                height: 30.h,
              ),

              Text(
                AppLocalizations.of(context)!.check_your_email,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 24.w),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                AppLocalizations.of(context)!
                    .we_have_sent_you_a_four_digit_code,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  child: Pinput(
                    keyboardType: TextInputType.number,
                    defaultPinTheme: PinTheme(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.brown)),
                    ),
                    focusedPinTheme: PinTheme(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.brown)),
                    ),
                    submittedPinTheme: PinTheme(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.brown)),
                    ),
                    controller: controller,
                  ),
                ),
              ]),
              SizedBox(
                height: 16.h,
              ),

              Text(
                AppLocalizations.of(context)!.send_the_code_again,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(decoration: TextDecoration.underline),
              )
            ],
          ),
        ),
      ),
    );
  }
}