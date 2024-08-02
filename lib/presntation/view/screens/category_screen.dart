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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              color: isDark! ? AppColors.darkGrey : AppColors.lightGrey,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark! ? AppColors.darkGrey : AppColors.lightGrey,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Sports",
                            style: getBoldStyle(
                                color:
                                    isDark! ? AppColors.white : AppColors.black,
                                fontSize: 20),
                          ),
                          SizedBox(
                            width: 160,
                            child: Text(
                              "All news about sports in earth ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: getBoldStyle(
                                  color: AppColors.grey, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 150,
                      height: 100,
                      child: Image.network(
                          fit: BoxFit.cover,
                          "https://img.freepik.com/free-photo/people-soccer-stadium_23-2151548540.jpg?t=st=1722604720~exp=1722608320~hmac=01fcc6d0d2db5330f45952048f297dcf9058c1299a61a9cec60ae77df0af55ba&w=2000"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}