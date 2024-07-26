import 'package:flutter/material.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:riff_switch/riff_switch.dart';

Widget buildAppearance(BuildContext context, {bool switchValue = false}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Appearance",
            style: getRegularStyle(color: AppColors.grey, fontSize: 18),
          ),
        ),
        SizedBox(
          height: context.height * 0.01,
        ),
        Material(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(20),
          elevation: 10,
          child: Container(
            width: double.infinity,
            height: context.height * 0.07,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Dark mode",
                    style:
                        getRegularStyle(color: AppColors.black, fontSize: 15),
                  ),
                  const Spacer(),
                  RiffSwitch(
                    value: switchValue,
                    onChanged: (value) {},
                    type: RiffSwitchType.material,
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.yellow,
                    inactiveTrackColor: AppColors.lightGrey,
                    inactiveThumbColor: AppColors.grey,
                    height: context.height * 0.05,
                    borderWidth: 2,
                    borderColor: AppColors.white,
                    borderRadius: 30,
                    thumbMargin: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
