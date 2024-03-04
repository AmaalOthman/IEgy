import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iegy/core/utils/app_colors.dart';

void navigate(
    {required BuildContext context, required String route, dynamic arg}) {
  Navigator.pushNamed(context, route, arguments: arg);
}

void navigateLast(
    {required BuildContext context, required String route, dynamic arg}) {
  Navigator.pushNamedAndRemoveUntil(context, route, ModalRoute.withName('/'),
      arguments: arg);
}

class ValidationUtils {
  static bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}

void showToast({
  required String message,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: Colors.white,
      fontSize: 16.0.w);
}

enum ToastStates { error, success, warning}

Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return AppColors.red;
    case ToastStates.success:
      return AppColors.darkBrown;
    case ToastStates.warning:
      return AppColors.blue;
  }
}