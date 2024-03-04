import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SendCodeScreen extends StatefulWidget {
  const SendCodeScreen({super.key});

  @override
  State<SendCodeScreen> createState() => _SendCodeScreenState();
}

class _SendCodeScreenState extends State<SendCodeScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    final pages = List.generate(
      3,
      (index) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(currentLocale.languageCode == 'ar'
              ? CupertinoIcons.arrow_turn_down_right
              : CupertinoIcons.arrow_turn_down_left),
          SizedBox(width: index == 0 ? 64.w : 35.w),
          CustomImage(
              imagePath: index == 0
                  ? AppAssets.forgetPassword
                  : index == 1
                      ? AppAssets.checkMail
                      : AppAssets.newPassword)
        ],
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 35.h),
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: (238 + 65.56).h,
                width: double.infinity,
                child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                  onPageChanged: (int index) {
                    setState(() {
                      currentPageIndex = index;
                    });
                    print("Displayed Page: ${index + 1}");
                  },
                ),
              ),
              SizedBox(
                height: 75.h,
              ),
              SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.darkBrown,
                  dotColor: AppColors.grey,
                  dotHeight: 6.h,
                  dotWidth: 6.w,
                  spacing: 3,
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}