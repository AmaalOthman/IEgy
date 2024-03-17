import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.controller,
      this.hint,
      this.label,
      this.validator,
      this.isObSecure,
      this.preIcon,
      this.suffixIcon,
      this.onSuffixPressed,
      this.keyboardType,
      this.shadow,
      this.focusNode,
      this.w,
      this.h,
      this.initialValue,
      this.style,
      this.align});
  final TextEditingController? controller;
  final String? hint, label, initialValue;
  final String? Function(String?)? validator;
  final bool? isObSecure;
  final bool? shadow;
  final Widget? preIcon, suffixIcon;
  final VoidCallback? onSuffixPressed;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final double? w, h;
  final TextStyle? style;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(59),
        boxShadow: shadow == true
            ? [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.08),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
      ),
      child: SizedBox(
        width: w,
        height: h,
        child: TextFormField(
          initialValue: initialValue,
          focusNode: focusNode,
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          obscureText: isObSecure ?? false,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: preIcon == null ? 20.w : 0),
              hintText: hint,
              labelText: label,
              prefixIcon: preIcon,
              suffixIcon: suffixIcon != null
                  ? IconButton(onPressed: onSuffixPressed, icon: suffixIcon!)
                  : null),
          style: style,
          textAlign: align?? TextAlign.start,
        ),
      ),
    );
  }
}
