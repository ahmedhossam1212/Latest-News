import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:latest_news/presntation/view/screens/login_screen.dart';
import 'package:latest_news/presntation/view/screens/main_screen.dart';
import 'package:latest_news/presntation/view/screens/register_screen.dart';

abstract class AppRouter {
  // paths

  static const registerRout = '/register';
  static const homeRout = '/home';
  static const loginRout = '/';

  // routes

  static final router = GoRouter(routes: [
    GoRoute(
      path: loginRout,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: registerRout,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: homeRout,
      builder: (context, state) => const MAinScreen(),
    )
  ]);

  // methods

  static void goPush(BuildContext context, String path) {
    GoRouter.of(context).push(path);
  }

  static void goAndFinish(BuildContext context, String path) {
    GoRouter.of(context).go(
      path,
    );
  }

  static void goBack(BuildContext context) {
    GoRouter.of(context).pop();
  }
}
