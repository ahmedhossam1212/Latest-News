import 'package:flutter/material.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';

Widget mainButton(
  BuildContext context, {
  required VoidCallback onpressd,
  required Color background,
  required String text,
}) =>
    Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: MaterialButton(
        minWidth: double.infinity,
        height: context.height * 0.07,
        onPressed: onpressd,
        color: background,
        child: Text(
          text,
          style: getRegularStyle(
              color: isDark! ? AppColors.black : AppColors.white, fontSize: 20),
        ),
      ),
    );
