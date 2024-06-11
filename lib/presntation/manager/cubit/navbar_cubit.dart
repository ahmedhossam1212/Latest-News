import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/presntation/manager/states/navbar_states.dart';
import 'package:latest_news/presntation/view/screens/category_screen.dart';
import 'package:latest_news/presntation/view/screens/feeds_screen.dart';
import 'package:latest_news/presntation/view/screens/profile_screen.dart';
import 'package:latest_news/presntation/view/screens/settings_screen.dart';

class NavbarCubit extends Cubit<NavbarStates> {
  NavbarCubit() : super(NavbarInitState());

  static NavbarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

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

  void changeNavBar(int index) {
    currentIndex = index;
    emit(NavbarSuccesState());
  }
}
