import 'package:flutter/material.dart';
import 'package:iegy/features/auth/presentation/screens/login_screen.dart';
import 'package:iegy/features/auth/presentation/screens/register_screen.dart';
import 'package:iegy/features/auth/presentation/screens/reset_password_navigator.dart';
import 'package:iegy/features/cart/presentation/screens/payment_screen.dart';
import 'package:iegy/features/home/presentation/screens/more_screen.dart';
import 'package:iegy/features/nav_bar/presentation/screens/nav_bar_screen.dart';
import 'package:iegy/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:iegy/features/profile/presentation/screens/orders_screen.dart';
import 'package:iegy/features/splash/presentation/screens/splash_screen.dart';
import 'package:iegy/features/splash/presentation/screens/welcome_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String login = '/login';
  static const String welcome = '/welcome';
  static const String resetPasswordNavigator = '/resetPasswordNavigator';
  static const String sendCode = '/sendCode';
  static const String navBar = '/navBar';
  static const String register = '/register';
  static const String searchScreen = '/searchScreen';
  static const String paymentScreen = '/paymentScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String moreScreen = '/moreScreen';
  static const String ordersScreen = '/ordersScreen';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.navBar:
        return MaterialPageRoute(builder: (_) => const NavBarScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.resetPasswordNavigator:
        return MaterialPageRoute(builder: (_) => const ResetPasswordNavigator());
      case Routes.paymentScreen:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case Routes.moreScreen:
        return MaterialPageRoute(builder: (_) => const MoreScreen());
      case Routes.ordersScreen:
        return MaterialPageRoute(builder: (_) => const OrdersScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(
          body: Center(
            child: Text('No Routes Found!'),
          ),
        ));
    }
  }
}
