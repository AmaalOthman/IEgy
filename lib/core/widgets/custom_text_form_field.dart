import 'package:flutter/material.dart';
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
      this.keyboardType, this.shadow, this.focusNode});
  final TextEditingController? controller;
  final String? hint, label;
  final String? Function(String?)? validator;
  final bool? isObSecure;
  final bool? shadow;
  final IconData? preIcon, suffixIcon;
  final VoidCallback? onSuffixPressed;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(59),
        boxShadow: shadow == true? [
          BoxShadow(
            color: AppColors.black.withOpacity(0.35),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ]: null,
      ),
      child: TextFormField(
        focusNode: focusNode,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        obscureText: isObSecure ?? false,
        decoration: InputDecoration(
            hintText: hint,
            labelText: label,
            prefixIcon: Icon(preIcon, color: AppColors.darkBlue),
            suffixIcon: IconButton(
                onPressed: onSuffixPressed,
                icon: Icon(suffixIcon, color: AppColors.darkBlue))),
      ),
    );
  }
}
