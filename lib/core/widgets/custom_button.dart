import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      this.background,
      required this.text,
      this.withIcon = false,
      this.icon,
      this.textColor,
      this.w = 320,
      this.h = 52,
      this.fontSize,
      this.elevation, this.textStyle, this.borderRadius});
  final double? h, w;
  final double? fontSize;
  final double? elevation;
  final double? borderRadius;
  final VoidCallback onPressed;
  final Color? background, textColor;
  final String text;
  final bool? withIcon;
  final Widget? icon;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: h!.h,
        width: w!.w,
        child: ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                elevation: MaterialStateProperty.all(elevation),
                backgroundColor:
                    MaterialStateProperty.all(background ?? AppColors.brown), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius?? 59),
              ),
            )),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: withIcon == true
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: textStyle?? Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: textColor ?? AppColors.white,
                      fontSize: fontSize ?? 16.w),
                ),
                if (withIcon == true)
                  icon ??
                      const Icon(
                        Icons.error,
                        color: AppColors.grey,
                      ),
              ],
            )));
  }
}
