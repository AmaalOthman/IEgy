import 'package:flutter/cupertino.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/widgets/custom_image.dart';

class NavBarIcon extends StatelessWidget {
  NavBarIcon(this.selected, this.selectedImagePath, this.unSelectedImagePath, {super.key});

  bool selected;
  String selectedImagePath, unSelectedImagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (selected)
          const CustomImage(imagePath: AppAssets.tabIndicator),
        CustomImage(imagePath: selected? selectedImagePath: unSelectedImagePath),
      ],
    );
  }
}
