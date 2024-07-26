import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/style_manager.dart';

Widget buildOrgCard({
  required VoidCallback fun,
  required String image,
  required String orgName,
}) =>
    InkWell(
      onTap: fun,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.lightGrey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(image),
            ),
          ),
          Text(
            orgName,
            style: getRegularStyle(color: AppColors.black, fontSize: 15),
          )
        ],
      ),
    );
