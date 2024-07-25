import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/core/routes/app_routes.dart';
import 'package:iegy/core/functions/common_methods.dart';
import 'package:iegy/features/nav_bar/presentation/cubit/nav_bar_cubit.dart';
import 'package:iegy/features/profile/data/repos/profile_repo.dart';
import 'package:iegy/features/profile/presentation/cubit/profile_cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;
  void onBackPressed(BuildContext context) {
    BlocProvider.of<NavBarCubit>(context).changeIndex(0);
    BlocProvider.of<NavBarCubit>(context).controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
  }

  void editProfile(BuildContext context) {
    navigate(context: context, route: Routes.editProfileScreen);
  }

  Future<void> logOut(BuildContext context) async {
    emit(LogOutLoadingState());
    try {
      await profileRepo.logout(context).then((value) {
        navigateLast(context: context, route: Routes.login);
      });
          (logOut) {
        emit(LogOutSuccessState(logOut));
      };
    } catch (error) {
      emit(LogOutErrorState(errorMessage: 'Logout failed: $error'));
    }
  }

  void goToOrders(BuildContext context) {
    navigate(context: context, route: Routes.ordersScreen);
  }

  void switchNotifications() {
    emit(NotificationSwitchedState());
  }

  void goToResetPassword(BuildContext context) {
    navigate(context: context, route: Routes.resetPasswordNavigator);
  }
}
