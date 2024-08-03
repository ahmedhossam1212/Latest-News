import 'package:flutter/material.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/generated/l10n.dart';

Widget buildAppLogo(BuildContext context) => Container(
      color: isDark! ? AppColors.black : AppColors.white,
      child: Row(
        children: [
          Container(
            width: context.width * 0.2,
            height: context.height * 0.05,
            decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                S.of(context).latest,
                style: getBoldStyle(color: AppColors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            width: context.width * 0.2,
            height: context.height * 0.05,
            decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                S.of(context).news,
                style: getBoldStyle(color: AppColors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
