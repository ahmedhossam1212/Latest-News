import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/config/network/local/cach_helper.dart';
import 'package:latest_news/config/routes/app_routs.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/generated/l10n.dart';
import 'package:latest_news/presntation/manager/cubit/auth_cubit.dart';
import 'package:latest_news/presntation/manager/states/auth_states.dart';
import 'package:latest_news/presntation/view/widgets/app_logo.dart';
import 'package:latest_news/presntation/view/widgets/input_feild.dart';
import 'package:latest_news/presntation/view/widgets/main_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        log("$state");
        if (state is AuthSuccessState) {
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            AppRouter.goAndFinish(context, AppRouter.homeRout);
          });
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          backgroundColor: isDark! ? AppColors.black : AppColors.white,
          appBar: AppBar(
            backgroundColor: isDark! ? AppColors.black : AppColors.white,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    buildAppLogo(context),
                    SizedBox(
                      height: context.height * 0.05,
                    ),
                    Text(
                      S.of(context).login,
                      style: getBoldStyle(
                          color: isDark! ? AppColors.white : AppColors.black,
                          fontSize: 30),
                    ),
                    Text(
                      S.of(context).login_msg,
                      style:
                          getRegularStyle(color: AppColors.grey, fontSize: 15),
                    ),
                    SizedBox(
                      height: context.height * 0.1,
                    ),
                    defualtFormField(context, controller: emailController,
                        validate: (String value) {
                      if (value.contains("@")) {
                        return null;
                      } else {
                        return "email not valied";
                      }
                    },
                        hint: S.of(context).email,
                        type: TextInputType.emailAddress,
                        width: double.infinity,
                        suffix: Icon(
                          Icons.email_outlined,
                          color: AppColors.grey,
                        )),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    defualtFormField(
                      context,
                      controller: passwordController,
                      validate: (String value) {
                        if (value.length < 5) {
                          return "invalid password";
                        } else {
                          return null;
                        }
                      },
                      hint: S.of(context).pass,
                      type: TextInputType.emailAddress,
                      width: double.infinity,
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        icon: Icon(
                          isPassword
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                          color: AppColors.grey,
                        ),
                      ),
                      isPassword: isPassword,
                    ),
                    SizedBox(
                      height: context.height * 0.04,
                    ),
                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        if (state is AuthLoadingState) {
                          return CircularProgressIndicator(
                            color: isDark! ? AppColors.white : AppColors.black,
                          );
                        } else {
                          return mainButton(context, onpressd: () {
                            if (formKey.currentState!.validate()) {
                              cubit.userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                              background:
                                  isDark! ? AppColors.white : AppColors.black,
                              text: S.of(context).login);
                        }
                      },
                    ),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        cubit.signInWithGoogle();
                      },
                      child: Container(
                        height: context.height * 0.05,
                        decoration: BoxDecoration(
                            color: isDark!
                                ? AppColors.darkGrey
                                : AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.g_mobiledata_outlined,
                              color: AppColors.grey,
                              size: 40,
                            ),
                            Text(
                              S.of(context).google,
                              style: getRegularStyle(
                                  color: isDark!
                                      ? AppColors.white
                                      : AppColors.black,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).havent_account,
                          style: getRegularStyle(
                              color:
                                  isDark! ? AppColors.white : AppColors.black,
                              fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            AppRouter.goPush(context, AppRouter.registerRout);
                          },
                          child: Text(
                            S.of(context).register,
                            style: getBoldStyle(
                                color: AppColors.yellow, fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
