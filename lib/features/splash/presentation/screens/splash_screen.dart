import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/routes/app_routes.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/functions/common_methods.dart';
import 'package:iegy/core/widgets/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateAfter3Seconds();
  }

  void navigateAfter3Seconds() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => navigateLast(context: context, route: Routes.welcome));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
          height: 200.h,
          width: 200.w,
          child: const CustomImage(imagePath: AppAssets.appLogo)),
    ));
  }
}
