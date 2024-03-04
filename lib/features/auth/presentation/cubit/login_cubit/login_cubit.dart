import 'dart:developer';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/routes/app_routes.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/utils/common_methods.dart';
import 'package:iegy/features/auth/presentation/cubit/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginPasswordHidden = true;
  Widget suffixIcon = const Icon(Icons.visibility, color: AppColors.darkBlue);

  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordHidden = !isLoginPasswordHidden;
    suffixIcon =
        Icon(isLoginPasswordHidden ? Icons.visibility : Icons.visibility_off, color: AppColors.darkBlue);
    emit(ChangeLoginPasswordSuffixIcon());
  }

  void onLoginPressed(context) {
    emit(LoginLoadingState());
    if (loginKey.currentState!.validate()) {
      log('login');
      navigateLast(context: context, route: Routes.navBar);
      emit(LoginSuccessState());
    } else {
      emit(LoginErrorState(AppLocalizations.of(context)!.login_failed));
    }
  }
}