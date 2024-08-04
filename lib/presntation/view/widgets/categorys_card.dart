import 'package:flutter/material.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/style_manager.dart';

Widget buildCategoryCard({
  required String title,
  required String discretion,
  required String image,
  required VoidCallback fun,
}) =>
    InkWell(
      onTap: fun,
      child: Material(
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
                      title,
                      style: getBoldStyle(
                          color: isDark! ? AppColors.white : AppColors.black,
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 160,
                      child: Text(
                        discretion,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            getBoldStyle(color: AppColors.grey, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 150,
                height: 100,
                child: Image.network(fit: BoxFit.cover, image),
              )
            ],
          ),
        ),
      ),
    );
