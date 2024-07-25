import 'package:flutter/material.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';

void showDefaultLoadingIndicator(BuildContext context, {bool? cancelable}) {
  showDialog(
      barrierColor: AppColors.grey.withOpacity(.8),
      context: context,
      builder: (BuildContext context) {
        return const CustomLoadingIndicator();
      },
      barrierDismissible: cancelable ?? true);
}