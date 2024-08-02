import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:latest_news/config/routes/app_routs.dart';
import 'package:latest_news/config/theme/app_theme.dart';
import 'package:latest_news/presntation/manager/cubit/auth_cubit.dart';
import 'package:latest_news/presntation/manager/cubit/navbar_cubit.dart';

import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp(this.isDark, {super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => NavbarCubit(),
        ),
      ],
      child: MaterialApp.router(
        locale: Locale("ar"),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: AppTheme.lightTheme(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
