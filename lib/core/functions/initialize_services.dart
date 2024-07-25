
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/database/cache/cache_helper.dart';
import 'package:iegy/core/services/service_locator.dart';

initializeServices() async {
  initServiceLocator();
  await sl<CacheHelper>().init();
  await ScreenUtil.ensureScreenSize();
}