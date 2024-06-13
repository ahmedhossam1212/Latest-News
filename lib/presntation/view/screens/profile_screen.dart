import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/network/local/cach_helper.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/presntation/manager/cubit/auth_cubit.dart';
import 'package:latest_news/presntation/manager/cubit/user_info_cubit.dart';
import 'package:latest_news/presntation/manager/states/auth_states.dart';
import 'package:latest_news/presntation/manager/states/user_info_states.dart';

import '../../../config/routes/app_routs.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserInfoCubit, UserInfoStates>(
      listener: (context, state) {
        if (state is UserInfoSuccesState) {}
      },
      builder: (context, state) {
        var cubit = UserInfoCubit.get(context);
        return Scaffold(
          body: Center(
            child: BlocBuilder<UserInfoCubit, UserInfoStates>(
              builder: (context, state) {
                if (state is UserInfoSuccesState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: context.height * 0.1,
                        backgroundImage: NetworkImage(cubit.userModel!.image!),
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      Text(
                        "${cubit.userModel!.name}",
                        style: getSemiBoldStyle(
                            color: AppColors.black, fontSize: 25),
                      ),
                      Text(
                        "${cubit.userModel!.email}",
                        style:
                            getLightStyle(color: AppColors.grey, fontSize: 20),
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                      BlocConsumer<AuthCubit, AuthStates>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return IconButton(
                              onPressed: () {
                                CacheHelper.removeData(key: 'uId');

                                AuthCubit.get(context).googleSignOut();
                                AuthCubit.get(context).logout(context);

                                AppRouter.goAndFinish(
                                    context, AppRouter.loginRout);
                              },
                              icon: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Logout ",
                                    style: getSemiBoldStyle(
                                        color: AppColors.black, fontSize: 25),
                                  ),
                                  Icon(
                                    Icons.login,
                                    color: AppColors.black,
                                  ),
                                ],
                              ));
                        },
                      ),
                    ],
                  );
                } else {
                  return CircularProgressIndicator(
                    color: AppColors.black,
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
