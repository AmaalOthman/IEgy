import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/features/auth/presentation/cubit/reset_password_navigator_cubit/reset_password_navigator_state.dart';
import 'package:iegy/features/auth/presentation/screens/check_email_screen.dart';
import 'package:iegy/features/auth/presentation/screens/forget_password_screen.dart';

class ResetPasswordNavigatorCubit extends Cubit<ResetPasswordNavigatorState> {
  ResetPasswordNavigatorCubit() : super(ResetPasswordNavigatorInitial());
  final controller = PageController(viewportFraction: 1, keepPage: true);
  bool isFirstPage = true;
  final pages = List.generate(
      3,
      (index) => index == 0
          ? const ForgetPasswordScreen()
          : index == 1
              ? CheckEmailScreen()
              : CheckEmailScreen());
}