import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/widgets/custom_image.dart';

class NavBarIcon extends StatelessWidget {
  NavBarIcon(this.selected, this.selectedImagePath, this.unSelectedImagePath, {super.key});

  bool selected;
  String selectedImagePath, unSelectedImagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (selected)
          CustomImage(imagePath: AppAssets.tabIndicator, w: 37.w,),
        // SizedBox(height: 11.94.h,),
        CustomImage(imagePath: selected? selectedImagePath: unSelectedImagePath, h: 24.h, w: 24.w,),
      ],
    );
  }
}
