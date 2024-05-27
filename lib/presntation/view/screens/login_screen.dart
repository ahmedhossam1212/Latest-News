import 'package:flutter/material.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: context.width * 0.2,
                    height: context.height * 0.05,
                    decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8))),
                    child: Center(
                      child: Text(
                        "Latest",
                        style:
                            getBoldStyle(color: AppColors.white, fontSize: 22),
                      ),
                    ),
                  ),
                  Container(
                    width: context.width * 0.2,
                    height: context.height * 0.05,
                    decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                    child: Center(
                      child: Text(
                        "News",
                        style:
                            getBoldStyle(color: AppColors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              Text(
                "Login",
                style: getBoldStyle(color: AppColors.black, fontSize: 30),
              ),
              Text(
                "Welcom back! explore news.",
                style: getRegularStyle(color: AppColors.grey, fontSize: 15),
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
                height: context.height * 0.04,
              ),
              mainButton(context,
                  onpressd: () {}, background: AppColors.black, text: "Login"),
              SizedBox(
                height: context.height * 0.03,
              ),
              Text(
                "Login with ",
                style: getSemiBoldStyle(color: AppColors.black, fontSize: 20),
              ),
              Container(
                width: context.width * 0.5,
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.facebook_outlined,
                          size: 40,
                        ),
                        color: AppColors.grey),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.g_mobiledata_outlined,
                          color: AppColors.grey,
                          size: 55,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style:
                        getRegularStyle(color: AppColors.black, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Register",
                      style:
                          getBoldStyle(color: AppColors.yellow, fontSize: 15),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
