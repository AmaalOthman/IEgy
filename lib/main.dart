import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/bloc/cubit/global_cubit.dart';
import 'package:iegy/core/bloc/cubit/global_state.dart';
import 'package:iegy/core/database/cache/cache_helper.dart';
import 'package:iegy/core/functions/initialize_services.dart';
import 'package:iegy/core/routes/app_routes.dart';
import 'package:iegy/core/services/service_locator.dart';
import 'package:iegy/core/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:iegy/features/auth/presentation/cubit/reset_password_navigator_cubit/reset_password_navigator_cubit.dart';
import 'package:iegy/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:iegy/features/cart/presentation/cubit/payment_cubit/payment_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/branches_cubit/branches_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/fav_cubit/fav_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/filter_cubit/filter_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/map_cubit/map_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/more_cubit/more_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/notification_cubit/notification_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/order_tracking_cubit/order_tracking_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/supply_and_installation_cubit/supply_and_installation_cubit.dart';
import 'package:iegy/features/nav_bar/presentation/cubit/nav_bar_cubit.dart';
import 'package:iegy/features/profile/presentation/cubit/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:iegy/features/profile/presentation/cubit/orders_cubit/orders_cubit.dart';
import 'package:iegy/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:iegy/features/splash/presentation/cubit/welcome_cubit.dart';

main() async {
  await initializeServices();
  runApp(DevicePreview(enabled: true, builder: (context) => MultiBlocProvider(providers: [
      BlocProvider(create: (context) => sl<GlobalCubit>()..getCachedLang()),
      BlocProvider(create: (context) => sl<AuthCubit>()),
      BlocProvider(create: (context) => sl<NavBarCubit>()),
      BlocProvider(create: (context) => sl<WelcomeCubit>()),
      BlocProvider(create: (context) => sl<HomeCubit>()),
      BlocProvider(create: (context) => sl<CartCubit>()),
      BlocProvider(create: (context) => sl<ProfileCubit>()),
      BlocProvider(create: (context) => sl<ResetPasswordNavigatorCubit>()),
      BlocProvider(create: (context) => sl<NotificationCubit>()),
      BlocProvider(create: (context) => sl<FilterCubit>()),
      BlocProvider(create: (context) => sl<EditProfileCubit>()),
      BlocProvider(create: (context) => sl<PaymentCubit>()),
      BlocProvider(create: (context) => sl<MoreCubit>()),
      BlocProvider(create: (context) => sl<OrdersCubit>()),
      BlocProvider(create: (context) => sl<BranchesCubit>()),
      BlocProvider(create: (context) => sl<OrderTrackingCubit>()),
      BlocProvider(create: (context) => sl<SupplyAndInstallationCubit>()),
      BlocProvider(create: (context) => sl<MapCubit>()),
      BlocProvider(create: (context) => sl<FavCubit>())
    ], child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (context, child) =>
            BlocBuilder<GlobalCubit, GlobalState>(builder: (context, state) {
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
                  locale:
                      Locale(BlocProvider.of<GlobalCubit>(context).langCode));
            }));
  }
}
