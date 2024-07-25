import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/core/routes/app_routes.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/functions/common_methods.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/features/splash/presentation/cubit/welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeInitial());
  final controller = PageController(viewportFraction: 1, keepPage: true);
  bool isFirstPage = true;
  final pages = List.generate(
    2,
    (index) => CustomImage(
      imagePath: index == 0 ? AppAssets.splash1 : AppAssets.splash2,
    ),
  );
  void onFloatingActionButtonPressed(context) {
    controller.page == pages.length - 1
        ? navigateLast(context: context, route: Routes.login)
        : controller.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCubicEmphasized,
          );
  }
}
