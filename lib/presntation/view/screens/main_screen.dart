import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/network/local/cach_helper.dart';
import 'package:latest_news/config/routes/app_routs.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/presntation/manager/cubit/auth_cubit.dart';
import 'package:latest_news/presntation/manager/states/auth_states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                var authCubit = AuthCubit.get(context);
                authCubit.googleSignOut();
                AppRouter.goAndFinish(context, AppRouter.loginRout);
                CacheHelper.removeData(key: "uId");
                CacheHelper.removeData(key: "Gtoken");
              },
              icon: Icon(
                Icons.login_outlined,
                color: AppColors.black,
              ),
            );
          },
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("home")],
        ),
      ),
    );
  }
}
