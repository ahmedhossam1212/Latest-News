import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/presntation/manager/cubit/navbar_cubit.dart';
import 'package:latest_news/presntation/manager/states/navbar_states.dart';
import 'package:riff_switch/riff_switch.dart';

import '../../../generated/l10n.dart';

Widget buildAppearance(
  BuildContext context,
  bool switchValue,
) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            S.of(context).appearance,
            style: getRegularStyle(color: AppColors.grey, fontSize: 18),
          ),
        ),
        SizedBox(
          height: context.height * 0.01,
        ),
        Material(
          color: isDark! ? AppColors.darkGrey : AppColors.lightGrey,
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(20),
          elevation: 10,
          child: Container(
            width: double.infinity,
            height: context.height * 0.07,
            decoration: BoxDecoration(
              color: isDark! ? AppColors.darkGrey : AppColors.lightGrey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    S.of(context).dark,
                    style: getRegularStyle(
                        color: isDark! ? AppColors.white : AppColors.black,
                        fontSize: 15),
                  ),
                  const Spacer(),
                  BlocConsumer<NavbarCubit, NavbarStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return RiffSwitch(
                        value: isDark! ? true : false,
                        onChanged: (value) {
                          switchValue = value;
                          NavbarCubit.get(context).changemode();
                        },
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
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
