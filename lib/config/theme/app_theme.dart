import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/style_manager.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.red, surfaceTint: Colors.transparent),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.blue,
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
      ),
      textTheme: TextTheme(
        displayLarge: getBoldStyle(color: Colors.black, fontSize: 35),
        displayMedium: getSemiBoldStyle(color: Colors.black, fontSize: 16),
        titleMedium: getMediumStyle(color: Colors.black, fontSize: 20),
        titleSmall: getMediumStyle(color: Colors.black, fontSize: 30),
        bodySmall: getRegularStyle(color: Colors.grey),
        bodyLarge: getRegularStyle(color: Colors.blueGrey, fontSize: 28),
        bodyMedium: getMediumStyle(color: Colors.black, fontSize: 10),
      ),
    );
  }
}
