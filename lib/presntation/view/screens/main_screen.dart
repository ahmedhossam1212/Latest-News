import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/config/network/local/cach_helper.dart';
import 'package:latest_news/config/routes/app_routs.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/presntation/manager/cubit/auth_cubit.dart';
import 'package:latest_news/presntation/manager/cubit/user_info_cubit.dart';
import 'package:latest_news/presntation/manager/states/auth_states.dart';
import 'package:latest_news/presntation/view/screens/category_screen.dart';
import 'package:latest_news/presntation/view/screens/feeds_screen.dart';
import 'package:latest_news/presntation/view/screens/profile_screen.dart';
import 'package:latest_news/presntation/view/screens/settings_screen.dart';
import 'package:latest_news/presntation/view/widgets/app_logo.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  var currentIndex = 0;
  @override
  void initState() {
    UserInfoCubit.get(context).getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          AppRouter.goAndFinish(context, AppRouter.loginRout);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: buildAppLogo(context),
            ),
            leadingWidth: double.infinity,
            actions: [
              IconButton(
                  onPressed: () {
                    CacheHelper.removeData(key: 'uId').then((value) {
                      if (value) {
                        AppRouter.goAndFinish(context, AppRouter.loginRout);
                      }
                    });
                    AuthCubit.get(context).googleSignOut(context);
                    AuthCubit.get(context).logout(context);
                  },
                  icon: const Icon(Icons.login))
            ],
          ),
          body: screens[currentIndex],
          bottomNavigationBar: Container(
            margin: EdgeInsets.all(displayWidth * .05),
            height: displayWidth * .155,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(50),
            ),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    HapticFeedback.lightImpact();
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == currentIndex
                          ? displayWidth * .32
                          : displayWidth * .18,
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: index == currentIndex ? displayWidth * .12 : 0,
                        width: index == currentIndex ? displayWidth * .32 : 0,
                        decoration: BoxDecoration(
                          color: index == currentIndex
                              ? Colors.deepOrangeAccent.withOpacity(.5)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == currentIndex
                          ? displayWidth * .31
                          : displayWidth * .18,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index == currentIndex
                                    ? displayWidth * .13
                                    : 0,
                              ),
                              AnimatedOpacity(
                                opacity: index == currentIndex ? 1 : 0,
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: Text(
                                  index == currentIndex
                                      ? listOfStrings[index]
                                      : '',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index == currentIndex
                                    ? displayWidth * .03
                                    : 20,
                              ),
                              Icon(
                                listOfIcons[index],
                                size: displayWidth * .076,
                                color: index == currentIndex
                                    ? AppColors.black
                                    : AppColors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
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

  List<IconData> listOfIcons = [
    CupertinoIcons.news_solid,
    Icons.category,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'Feed',
    'Category',
    'Settings',
    'Profile',
  ];

  List<Widget> screens = [
    const FeedsScreen(),
    const CategoryScreen(),
    const SettingsScreen(),
    const ProfileScreen()
  ];
}
