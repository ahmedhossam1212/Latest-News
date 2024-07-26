import 'package:flutter/material.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/style_manager.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark! ? AppColors.black : AppColors.white,
      body: Center(
          child: Text(
        "Category Screen",
        style: getBoldStyle(
          color: isDark! ? AppColors.white : AppColors.black,
        ),
      )),
    );
  }
}
