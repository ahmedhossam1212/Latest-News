import 'package:flutter/material.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/config/routes/app_routs.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/generated/l10n.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark! ? AppColors.black : AppColors.white,
      appBar: AppBar(
        backgroundColor: isDark! ? AppColors.black : AppColors.white,
        title: Text(
          S.of(context).technology,
          style: getBoldStyle(
              color: isDark! ? AppColors.white : AppColors.black, fontSize: 17),
        ),
        leading: IconButton(
            onPressed: () {
              AppRouter.goBack(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: isDark! ? AppColors.white : AppColors.black,
            )),
      ),
    );
  }
}
