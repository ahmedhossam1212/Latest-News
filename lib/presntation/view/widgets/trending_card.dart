import 'package:flutter/material.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/models/trending_model.dart';
import 'package:intl/intl.dart';

Widget buildTrends(
  BuildContext context,
  Articles model,
) =>
    Material(
      color: AppColors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width * 0.55,
                height: context.height * 0.15,
                child: Text(
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  model.title,
                  style: getSemiBoldStyle(color: AppColors.black, fontSize: 20),
                ),
              ),
              SizedBox(
                height: context.height * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: context.width * 0.3,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      "${model.author}",
                      style:
                          getLightStyle(fontSize: 15, color: AppColors.yellow),
                    ),
                  ),
                  SizedBox(
                    width: context.width * 0.01,
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.grey,
                    radius: 5,
                  ),
                  SizedBox(
                    width: context.width * 0.01,
                  ),
                  Text(
                    "${DateFormat.yMMMMd().format(DateTime.parse(model.publishedAt))} ",
                    style: getLightStyle(fontSize: 15, color: AppColors.grey),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: context.height * 0.175,
            width: context.width * 0.3,
            child: Image.network(fit: BoxFit.cover, "${model.urlToImage}"),
          )
        ],
      ),
    );
