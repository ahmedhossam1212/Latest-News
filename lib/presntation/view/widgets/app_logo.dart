import 'package:flutter/material.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';

Widget buildAppLogo(BuildContext context) => Row(
      children: [
        Container(
          width: context.width * 0.2,
          height: context.height * 0.05,
          decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))),
          child: Center(
            child: Text(
              "Latest",
              style: getBoldStyle(color: AppColors.white, fontSize: 20),
            ),
          ),
        ),
        Container(
          width: context.width * 0.2,
          height: context.height * 0.05,
          decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
          child: Center(
            child: Text(
              "News",
              style: getBoldStyle(color: AppColors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
