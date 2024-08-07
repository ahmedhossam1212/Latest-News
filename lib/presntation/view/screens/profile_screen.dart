import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/presntation/manager/cubit/user_info_cubit.dart';
import 'package:latest_news/presntation/manager/states/user_info_states.dart';

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
          backgroundColor: isDark! ? AppColors.black : AppColors.white,
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
                            color: isDark! ? AppColors.white : AppColors.black,
                            fontSize: 25),
                      ),
                      Text(
                        "${cubit.userModel!.email}",
                        style:
                            getLightStyle(color: AppColors.grey, fontSize: 20),
                      ),
                      SizedBox(
                        height: context.height * 0.05,
                      ),
                    ],
                  );
                } else {
                  return CircularProgressIndicator(
                    color: isDark! ? AppColors.white : AppColors.black,
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
