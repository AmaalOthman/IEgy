import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/widgets/custom_image.dart';

class DrawerItem extends StatelessWidget {
  DrawerItem({super.key, required this.iconPath, required this.text, required this.navigateTo});
  String iconPath, text;
  VoidCallback navigateTo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: GestureDetector(
        onTap: navigateTo,
        child: Row(
          children: [
            CustomImage(imagePath: iconPath, w: 24.w, h: 29.44.h,),
            SizedBox(width: 10.w,),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}