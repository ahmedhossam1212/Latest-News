import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/routes/app_routs.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/presntation/manager/cubit/trending_cubit.dart';
import 'package:latest_news/presntation/manager/states/trending_states.dart';
import 'package:latest_news/presntation/view/widgets/orgnizations_card.dart';
import 'package:latest_news/presntation/view/widgets/slider.dart';
import 'package:latest_news/presntation/view/widgets/news_card.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final scrollController = ScrollController();
  int trendsLength = 5;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollLisntner);
  }

  void scrollLisntner() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (trendsLength < 20) {
        setState(() {
          trendsLength = trendsLength + 5;
          TrendingCubit.get(context).getTrends(fromPagination: true);
        });
      }

      log("$trendsLength");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrendingCubit, TrendingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TrendingCubit.get(context);
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildSlider(context),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    Text(
                      "Popular Organization",
                      style: getBoldStyle(color: AppColors.black, fontSize: 25),
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          buildOrgCard(
                              fun: () {},
                              image: "assets/logos/audi-svgrepo-com.svg",
                              orgName: "Audi"),
                          SizedBox(
                            width: context.width * 0.02,
                          ),
                          buildOrgCard(
                              fun: () {},
                              image: "assets/logos/Amazon_logo.svg",
                              orgName: "Amazon"),
                          SizedBox(
                            width: context.width * 0.02,
                          ),
                          buildOrgCard(
                              fun: () {},
                              image: "assets/logos/apple.svg",
                              orgName: "Apple"),
                          SizedBox(
                            width: context.width * 0.02,
                          ),
                          buildOrgCard(
                              fun: () {},
                              image: "assets/logos/bmw-svgrepo-com.svg",
                              orgName: "BMW"),
                          SizedBox(
                            width: context.width * 0.02,
                          ),
                          buildOrgCard(
                              fun: () {},
                              image: "assets/logos/google-icon-logo.svg",
                              orgName: "Google"),
                          SizedBox(
                            width: context.width * 0.02,
                          ),
                          buildOrgCard(
                              fun: () {},
                              image: "assets/logos/meta-svgrepo-com.svg",
                              orgName: "Meta"),
                          SizedBox(
                            width: context.width * 0.02,
                          ),
                          buildOrgCard(
                              fun: () {},
                              image: "assets/logos/spacex.svg",
                              orgName: "SpaceX"),
                          SizedBox(
                            width: context.width * 0.02,
                          ),
                          buildOrgCard(
                              fun: () {},
                              image: "assets/logos/tesla.svg",
                              orgName: "Tesla"),
                          SizedBox(
                            width: context.width * 0.02,
                          ),
                          buildOrgCard(
                              fun: () {
                                AppRouter.goPush(context, AppRouter.X);
                              },
                              image: "assets/logos/X_logo_2023.svg",
                              orgName: "X"),
                          SizedBox(
                            width: context.width * 0.02,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Text(
                      "Trends",
                      style: getBoldStyle(color: AppColors.black, fontSize: 25),
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    BlocBuilder<TrendingCubit, TrendingStates>(
                      buildWhen: (previous, current) =>
                          current is! TrendingPaginationState,
                      builder: (context, state) {
                        if (state is TrendingLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.black,
                            ),
                          );
                        } else if (state is TrendingSuccessState) {
                          return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => buildNewsCard(
                                    context,
                                    cubit.trends[index],
                                  ),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: context.height * 0.02,
                                  ),
                              itemCount: trendsLength);
                        } else {
                          return const Text("Err");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: BlocBuilder<TrendingCubit, TrendingStates>(
            builder: (context, state) {
              if (state is TrendingPaginationState) {
                return Align(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(25),
                      elevation: 10,
                      child: CircleAvatar(
                          radius: context.height * 0.025,
                          backgroundColor: AppColors.white,
                          child: CircularProgressIndicator(
                            color: AppColors.black,
                          )),
                    ));
              } else {
                return const Text("");
              }
            },
          ),
        );
      },
    );
  }
}
