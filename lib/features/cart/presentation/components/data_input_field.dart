import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_text_form_field.dart';

class DataInputField extends StatelessWidget {
  const DataInputField({super.key, this.h = 56, this.w, this.hint});

  final double? h, w;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      radius: 8,
      border: Border.all(color: AppColors.semiPrimary),
      w: w,
      h: h!.h,
      hint: hint,
      style: GoogleFonts.ibmPlexSansArabic(color: AppColors.grey, fontSize: 14.w, fontWeight: FontWeight.normal),
      hintStyle: GoogleFonts.ibmPlexSansArabic(color: AppColors.grey, fontSize: 14.w, fontWeight: FontWeight.normal),
    );
  }
}