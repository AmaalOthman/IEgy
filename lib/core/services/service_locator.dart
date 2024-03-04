import 'package:get_it/get_it.dart';
import 'package:iegy/core/bloc/cubit/global_cubit.dart';
import 'package:iegy/core/database/cache/cache_helper.dart';
import 'package:iegy/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:iegy/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/home_cubit.dart';
import 'package:iegy/features/nav_bar/presentation/cubit/nav_bar_cubit.dart';
import 'package:iegy/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:iegy/features/splash/presentation/cubit/welcome_cubit.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerLazySingleton(() => GlobalCubit());
  sl.registerLazySingleton(() => LoginCubit());
  sl.registerLazySingleton(() => NavBarCubit());
  sl.registerLazySingleton(() => WelcomeCubit());
  sl.registerLazySingleton(() => HomeCubit());
  sl.registerLazySingleton(() => CartCubit());
  sl.registerLazySingleton(() => ProfileCubit());
  sl.registerLazySingleton(() => CacheHelper());
}