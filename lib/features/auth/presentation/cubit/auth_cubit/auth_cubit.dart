import 'dart:developer';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/core/routes/app_routes.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/functions/common_methods.dart';
import 'package:iegy/features/auth/data/models/sign_up_request_body.dart';
import 'package:iegy/features/auth/data/models/user_model.dart';
import 'package:iegy/features/auth/data/repos/auth_repo.dart';
import 'package:iegy/features/auth/presentation/cubit/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  final AuthRepo _authRepo;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPhoneController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpPasswordConfirmationController =
      TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isLoginPasswordHidden = true;
  bool isRegisterPasswordHidden = true;
  bool isRegisterPassConfirmHidden = true;
  Widget suffixIcon = const Icon(Icons.visibility, color: AppColors.darkBlue);
  Widget registerPasswordSuffix = const Icon(Icons.visibility, color: AppColors.darkBlue);
  Widget registerPassConfirmSuffix = const Icon(Icons.visibility, color: AppColors.darkBlue);
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  static AuthCubit get(context) => BlocProvider.of(context);

  void disposeControllers() {
    loginEmailController.clear();
    loginEmailController.dispose();

    signUpEmailController.clear();
    signUpEmailController.dispose();

    signUpPhoneController.clear();
    signUpPhoneController.dispose();

    loginPasswordController.clear();
    loginPasswordController.dispose();

    signUpPasswordController.clear();
    signUpPasswordController.dispose();

    signUpPasswordConfirmationController.clear();
    signUpPasswordConfirmationController.dispose();

    nameController.clear();
    nameController.dispose();
  }

  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordHidden = !isLoginPasswordHidden;
    suffixIcon = Icon(
        isLoginPasswordHidden ? Icons.visibility : Icons.visibility_off,
        color: AppColors.darkBlue);
    emit(ChangeLoginPasswordSuffixIcon());
  }

  void changeRegisterPasswordSuffixIcon() {
    isRegisterPasswordHidden = !isRegisterPasswordHidden;
    registerPasswordSuffix = Icon(
        isRegisterPasswordHidden ? Icons.visibility : Icons.visibility_off,
        color: AppColors.darkBlue);
    emit(ChangeLoginPasswordSuffixIcon());
  }

  void changeRegisterPassConfirmSuffixIcon() {
    isRegisterPassConfirmHidden = !isRegisterPassConfirmHidden;
    registerPassConfirmSuffix = Icon(
        isRegisterPassConfirmHidden ? Icons.visibility : Icons.visibility_off,
        color: AppColors.darkBlue);
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

  void onRegisterPressed(BuildContext context) {
    navigateLast(context: context, route: Routes.register);
  }

  void onForgotPasswordPressed(BuildContext context) {
    navigate(context: context, route: Routes.sendCode);
  }

  void onForgetPasswordPressed(BuildContext context) {
    navigate(context: context, route: Routes.resetPasswordNavigator);
  }

  void removeKeyboard() {
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();
  }

  void validateThenDoSignUp(BuildContext context) async {
    if (registerKey.currentState!.validate()) {
      await signUpWithEmailAndPhone(SignUpRequestBody(
          name: nameController.text,
          email: signUpEmailController.text,
          password: signUpPasswordController.text,
          phoneNumber: signUpPhoneController.text,
          passwordConfirmation: signUpPasswordConfirmationController.text), context);
    }
  }

  Future<void> signUpWithEmailAndPhone(SignUpRequestBody signUpRequestBody, BuildContext context) async {
    emit(RegisterLoadingState());
    final response = await _authRepo.signUpWithEmailAndPassword(signUpRequestBody, context);
    response.fold((failure) {
      emit(RegisterErrorState(failure));
    }, (authResponse) async {
      log(authResponse.toString(), name: 'Auth Response');
      /*await CacheHelper()
          .saveData("access_token", authResponse.token)
          .then((value) {
        DefaultLogger.logger.w("TOKEN SAVED SUCCESSFULLY ");
        DefaultLogger.logger.w(authResponse.token.toString());
      });
      log(authResponse.toString());*/
      emit(RegisterSuccessState(UserModel(image: authResponse.image, id: authResponse.id, name: authResponse.name, phone:
      authResponse.phone, address: authResponse.address, email: authResponse.email, pushToken: authResponse.pushToken)));
    });
  }
}
