import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/bloc/cubit/global_cubit.dart';
import 'package:iegy/core/bloc/cubit/global_state.dart';
import 'package:iegy/core/database/cache/cache_helper.dart';
import 'package:iegy/core/routes/app_routes.dart';
import 'package:iegy/core/services/service_locator.dart';
import 'package:iegy/core/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:iegy/features/auth/presentation/cubit/reset_password_navigator_cubit/reset_password_navigator_cubit.dart';
import 'package:iegy/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/notification_cubit/notification_cubit.dart';
import 'package:iegy/features/nav_bar/presentation/cubit/nav_bar_cubit.dart';
import 'package:iegy/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:iegy/features/splash/presentation/cubit/welcome_cubit.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => sl<GlobalCubit>()..getCachedLang()),
      BlocProvider(
        create: (context) => sl<LoginCubit>(),
      ),
      BlocProvider(
        create: (context) => sl<NavBarCubit>(),
      ),
      BlocProvider(create: (context) => sl<WelcomeCubit>()),
      BlocProvider(create: (context) => sl<HomeCubit>()),
      BlocProvider(create: (context) => sl<CartCubit>()),
      BlocProvider(create: (context) => sl<ProfileCubit>()),
      BlocProvider(create: (context) => sl<ResetPasswordNavigatorCubit>()),
      BlocProvider(create: (context) => sl<NotificationCubit>()),
      BlocProvider(create: (context) => sl<FilterCubit>())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) => BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return MaterialApp(
            initialRoute: Routes.initialRoute,
            onGenerateRoute: AppRoutes.generateRoute,
            title: 'IEgy',
            theme: getAppTheme(),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar'), // العربية
              Locale('en') // Spanish
            ],
            locale: Locale(BlocProvider.of<GlobalCubit>(context).langCode),
          );
        },
      ),
    );
  }
}
