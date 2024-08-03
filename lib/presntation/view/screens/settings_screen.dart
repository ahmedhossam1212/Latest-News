import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/config/network/local/cach_helper.dart';
import 'package:latest_news/config/routes/app_routs.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/presntation/manager/cubit/auth_cubit.dart';
import 'package:latest_news/presntation/manager/cubit/navbar_cubit.dart';
import 'package:latest_news/presntation/manager/states/auth_states.dart';
import 'package:latest_news/presntation/manager/states/navbar_states.dart';

import 'package:latest_news/presntation/view/widgets/appearance_widget.dart';

import '../../../generated/l10n.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavbarCubit, NavbarStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: isDark! ? AppColors.black : AppColors.white,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildAppearance(context, isDark!),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  Material(
                    color: isDark! ? AppColors.darkGrey : AppColors.lightGrey,
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color:
                            isDark! ? AppColors.darkGrey : AppColors.lightGrey,
                      ),
                      child: ExpansionTile(
                        childrenPadding: const EdgeInsets.all(5),
                        shape: Border.all(
                            color: isDark!
                                ? AppColors.darkGrey
                                : AppColors.lightGrey),
                        backgroundColor:
                            isDark! ? AppColors.darkGrey : AppColors.lightGrey,
                        clipBehavior: Clip.hardEdge,
                        iconColor: isDark! ? AppColors.white : AppColors.black,
                        collapsedIconColor:
                            isDark! ? AppColors.white : AppColors.black,
                        title: Text(
                          S.of(context).lang,
                          style: getRegularStyle(
                              color:
                                  isDark! ? AppColors.white : AppColors.black,
                              fontSize: 15),
                        ),
                        children: [
                          TextButton(
                              onPressed: () {
                                NavbarCubit.get(context).arLang();
                              },
                              child: Row(
                                children: [
                                  Text(
                                    " ${S.of(context).ar}",
                                    style: getBoldStyle(
                                        color: isDark!
                                            ? AppColors.white
                                            : AppColors.black,
                                        fontSize: 14),
                                  )
                                ],
                              )),
                          TextButton(
                              onPressed: () {
                                NavbarCubit.get(context).enLang();
                              },
                              child: Row(
                                children: [
                                  Text(
                                    " ${S.of(context).en}",
                                    style: getBoldStyle(
                                        color: isDark!
                                            ? AppColors.white
                                            : AppColors.black,
                                        fontSize: 14),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  BlocConsumer<AuthCubit, AuthStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return IconButton(
                          onPressed: () {
                            CacheHelper.removeData(key: 'uId');
                            AuthCubit.get(context).googleSignOut();
                            AuthCubit.get(context).logout(context);
                            AppRouter.goAndFinish(context, AppRouter.loginRout);
                          },
                          icon: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${S.of(context).en} ",
                                style: getSemiBoldStyle(
                                    color: Colors.red, fontSize: 20),
                              ),
                              const Icon(
                                Icons.login,
                                color: Colors.red,
                              ),
                            ],
                          ));
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}
