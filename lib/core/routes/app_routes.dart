import 'package:flutter/material.dart';
import 'package:iegy/features/auth/presentation/screens/enter_code_screen.dart';
import 'package:iegy/features/auth/presentation/screens/login_screen.dart';
import 'package:iegy/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:iegy/features/auth/presentation/screens/send_code_screen.dart';
import 'package:iegy/features/nav_bar/presentation/screens/nav_bar_screen.dart';
import 'package:iegy/features/splash/presentation/screens/splash_screen.dart';
import 'package:iegy/features/splash/presentation/screens/welcome_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String login = '/login';
  static const String welcome = '/welcome';
  static const String enterCode = '/enterCode';
  static const String resetPassword = '/resetPassword';
  static const String sendCode = '/sendCode';
  static const String navBar = '/navBar';
  static const String searchScreen = '/searchScreen';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case Routes.enterCode:
        return MaterialPageRoute(builder: (_) => const EnterCodeScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.sendCode:
        return MaterialPageRoute(builder: (_) => const SendCodeScreen());
      case Routes.navBar:
        return MaterialPageRoute(builder: (_) => const NavBarScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(
          body: Center(
            child: Text('No Routes Found!'),
          ),
        ));
    }
  }
}
