import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/routes/app_routs.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/presntation/manager/cubit/auth_cubit.dart';
import 'package:latest_news/presntation/manager/states/auth_states.dart';

class MAinScreen extends StatelessWidget {
  const MAinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                cubit.googleSignOut();
                AppRouter.goAndFinish(context, AppRouter.loginRout);
              },
              icon: Icon(
                Icons.login_outlined,
                color: AppColors.black,
              ),
            ),
          ),
          body: const Column(
            children: [
              Text("HOME"),
            ],
          ),
        );
      },
    );
  }
}
