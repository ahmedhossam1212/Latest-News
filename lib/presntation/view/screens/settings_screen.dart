import 'package:flutter/material.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Appearance",
              style: getRegularStyle(color: AppColors.grey, fontSize: 20),
            ),
          ),
          SizedBox(
            height: context.height * 0.01,
          ),
          Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(20),
            elevation: 10,
            child: Container(
              width: double.infinity,
              height: context.height * 0.08,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Theme",
                      style:
                          getRegularStyle(color: AppColors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
