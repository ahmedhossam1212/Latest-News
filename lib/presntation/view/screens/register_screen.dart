import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/config/network/local/cach_helper.dart';
import 'package:latest_news/config/routes/app_routs.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/presntation/manager/cubit/auth_cubit.dart';
import 'package:latest_news/presntation/manager/states/auth_states.dart';
import 'package:latest_news/presntation/view/widgets/app_logo.dart';
import 'package:latest_news/presntation/view/widgets/input_feild.dart';
import 'package:latest_news/presntation/view/widgets/main_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
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
            leading: IconButton(
                onPressed: () {
                  AppRouter.goBack(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark! ? AppColors.white : AppColors.black,
                )),
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
                      "Register",
                      style: getBoldStyle(
                          color: isDark! ? AppColors.white : AppColors.black,
                          fontSize: 30),
                    ),
                    Text(
                      "Browse what's going on around the world",
                      style:
                          getRegularStyle(color: AppColors.grey, fontSize: 15),
                    ),
                    SizedBox(
                      height: context.height * 0.1,
                    ),
                    defualtFormField(context, controller: nameController,
                        validate: (String value) {
                      if (value.isEmpty) {
                        return "Name not valied";
                      }
                    },
                        hint: "Name",
                        type: TextInputType.name,
                        width: double.infinity,
                        suffix: Icon(
                          Icons.person_outline,
                          color: AppColors.grey,
                        )),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    defualtFormField(context, controller: emailController,
                        validate: (String value) {
                      if (value.contains("@")) {
                        return null;
                      } else {
                        return "email not valied";
                      }
                    },
                        hint: "Email",
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
                          return "invaled password";
                        } else {
                          return null;
                        }
                      },
                      hint: "Password",
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
                      height: context.height * 0.02,
                    ),
                    defualtFormField(
                      context,
                      controller: confirmPasswordController,
                      validate: (String value) {
                        if (value != passwordController.text) {
                          return "invaled password";
                        } else {
                          return null;
                        }
                      },
                      hint: "Confirm password",
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
                      height: context.height * 0.06,
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
                              cubit.userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                              background:
                                  isDark! ? AppColors.white : AppColors.black,
                              text: "Create account");
                        }
                      },
                    ),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
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
