import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
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
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
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
                  h: 58,
                  w: 190.w,
                  hint: AppLocalizations.of(context)!.first_name,
                ),
                DataInputField(
                  h: 58,
                  w: 190.w,
                  hint: AppLocalizations.of(context)!.last_name,
                )
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.semiPrimary)),
                  width: double.infinity,
                  height: 56.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
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
                        width: 313.91.w,
                      ),
                      CustomImage(
                          imagePath: AppAssets.arrowDown, h: 14.h, w: 8.24.w)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            const DataInputField()
          ],
        );
      },
    );
  }
}
