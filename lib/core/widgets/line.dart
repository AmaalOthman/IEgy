import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Line extends StatelessWidget {
  const Line({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? const Color(0xffa7a7a7),
      height: 1.h,
      width: double.infinity,
    );
  }
}
