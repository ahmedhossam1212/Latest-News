import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          appBar: AppBar(),
          body: Column(
            children: [
              SizedBox(
                  width: 200,
                  height: 300,
                  child: Image.network(cubit.user!.photoURL!)),
              Text(cubit.user!.displayName!),
              Text(cubit.user!.email!),
            ],
          ),
        );
      },
    );
  }
}
