import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/features/profile/presentation/cubit/edit_profile_cubit/edit_profile_state.dart';
import 'package:iegy/features/profile/presentation/screens/change_pic_bottom_sheet.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  void goBack (BuildContext context) {
    Navigator.pop(context);
  }

  void showChangePicBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.primary,
        context: context,
        builder: (_) {
          return const ChangePicBottomSheet();
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))));
  }
}