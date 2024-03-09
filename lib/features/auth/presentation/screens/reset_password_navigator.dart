import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/features/auth/presentation/cubit/reset_password_navigator_cubit/reset_password_navigator_cubit.dart';
import 'package:iegy/features/auth/presentation/cubit/reset_password_navigator_cubit/reset_password_navigator_state.dart';

class ResetPasswordNavigator extends StatelessWidget {
  const ResetPasswordNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordNavigatorCubit, ResetPasswordNavigatorState>(
      builder: (context, state) {
        return PageView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          controller: BlocProvider.of<ResetPasswordNavigatorCubit>(context).controller,
          itemCount: BlocProvider.of<ResetPasswordNavigatorCubit>(context).pages.length,
          itemBuilder: (_, index) {
            return BlocProvider.of<ResetPasswordNavigatorCubit>(context).pages[index % BlocProvider.of<ResetPasswordNavigatorCubit>(context).pages.length];
          },
        );
      },);
  }
}