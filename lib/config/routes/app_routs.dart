import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/presntation/manager/cubit/orgnization_cubit.dart';
import 'package:latest_news/presntation/manager/cubit/trending_cubit.dart';
import 'package:latest_news/presntation/manager/cubit/user_info_cubit.dart';
import 'package:latest_news/presntation/view/screens/login_screen.dart';

import 'package:latest_news/presntation/view/screens/main_screen.dart';
import 'package:latest_news/presntation/view/screens/orgs/amazon_screen.dart';
import 'package:latest_news/presntation/view/screens/orgs/apple_screen.dart';
import 'package:latest_news/presntation/view/screens/orgs/audi_screen.dart';
import 'package:latest_news/presntation/view/screens/orgs/bmw_screen.dart';
import 'package:latest_news/presntation/view/screens/orgs/google_screen.dart';
import 'package:latest_news/presntation/view/screens/orgs/meta_screen.dart';
import 'package:latest_news/presntation/view/screens/orgs/spaceX_screen.dart';
import 'package:latest_news/presntation/view/screens/orgs/tesla_screen.dart';
import 'package:latest_news/presntation/view/screens/orgs/x_screen.dart';
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
  static const X = '/X';
  static const google = '/google';
  static const amazon = '/amazon';
  static const apple = '/apple';
  static const tesla = '/tesla';
  static const meta = '/meta';
  static const spacex = '/spacex';
  static const audi = '/audi';
  static const bmw = '/bmw';

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
          ),
          BlocProvider(
            create: (context) => TrendingCubit()..getTrends(),
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
    GoRoute(
      path: X,
      builder: (context, state) => BlocProvider(
          create: (context) => OrgnizationCubit()..fetchOrgs(org: "X"),
          child: const XScreen()),
    ),
    GoRoute(
      path: google,
      builder: (context, state) => BlocProvider(
          create: (context) => OrgnizationCubit()..fetchOrgs(org: "Google"),
          child: const GoogleScreen()),
    ),
    GoRoute(
      path: amazon,
      builder: (context, state) => BlocProvider(
          create: (context) => OrgnizationCubit()..fetchOrgs(org: "Amazon"),
          child: const AmazonScreen()),
    ),
    GoRoute(
      path: apple,
      builder: (context, state) => BlocProvider(
          create: (context) => OrgnizationCubit()..fetchOrgs(org: "Apple"),
          child: const AppleScreen()),
    ),
    GoRoute(
      path: tesla,
      builder: (context, state) => BlocProvider(
          create: (context) => OrgnizationCubit()..fetchOrgs(org: "Tesla"),
          child: const TeslaScreen()),
    ),
    GoRoute(
      path: meta,
      builder: (context, state) => BlocProvider(
          create: (context) => OrgnizationCubit()..fetchOrgs(org: "Meta"),
          child: const MetaScreen()),
    ),
    GoRoute(
      path: spacex,
      builder: (context, state) => BlocProvider(
          create: (context) => OrgnizationCubit()..fetchOrgs(org: "SpaceX"),
          child: const SpaceXScreen()),
    ),
    GoRoute(
      path: audi,
      builder: (context, state) => BlocProvider(
          create: (context) => OrgnizationCubit()..fetchOrgs(org: "Audi"),
          child: const AudiScreen()),
    ),
    GoRoute(
      path: bmw,
      builder: (context, state) => BlocProvider(
          create: (context) => OrgnizationCubit()..fetchOrgs(org: "BMW"),
          child: const BMWScreen()),
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
