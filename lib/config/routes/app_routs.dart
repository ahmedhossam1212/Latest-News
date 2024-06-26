import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/presntation/manager/cubit/user_info_cubit.dart';
import 'package:latest_news/presntation/view/screens/login_screen.dart';

import 'package:latest_news/presntation/view/screens/main_screen.dart';
import 'package:latest_news/presntation/view/screens/register_screen.dart';
import 'package:latest_news/presntation/view/widgets/gaza_webview.dart';
import 'package:latest_news/presntation/view/widgets/hollywood_web_view.dart';
import 'package:latest_news/presntation/view/widgets/premierleague_webview.dart';

abstract class AppRouter {
  // paths
  static const registerRout = '/register';
  static const homeRout = '/home';
  static const loginRout = '/';
  static const hollywoodWebV = '/hollywoodWebV';
  static const gazaWebV = '/gazaWebV';
  static const premierLeagueWebV = '/premierLeagueWebV';

  // routes

  static final router =
      GoRouter(initialLocation: uId != null ? '/home' : '/', routes: [
    GoRoute(path: loginRout, builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: registerRout,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: homeRout,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserInfoCubit()..getUserInfo(uId: uId!),
          )
        ],
        child: const MainScreen(),
      ),
    ),
    GoRoute(
      path: hollywoodWebV,
      builder: (context, state) => const HollywoodWebView(),
    ),
    GoRoute(
      path: gazaWebV,
      builder: (context, state) => const GazaWebView(),
    ),
    GoRoute(
      path: premierLeagueWebV,
      builder: (context, state) => const PremierleagueWebview(),
    ),
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
