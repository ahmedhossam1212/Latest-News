import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/generated/l10n.dart';
import 'package:latest_news/presntation/manager/cubit/categories_cubit.dart';
import 'package:latest_news/presntation/manager/states/categories_states.dart';
import 'package:latest_news/presntation/view/widgets/news_card.dart';

import '../../../../config/routes/app_routs.dart';

class ScienceScreen extends StatefulWidget {
  const ScienceScreen({super.key});

  @override
  State<ScienceScreen> createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<ScienceScreen> {
  final scrollController = ScrollController();
  int orgsLength = 10;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollLisntner);
  }

  void scrollLisntner() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (orgsLength < 100) {
        setState(() {
          orgsLength = orgsLength + 10;
          CategoriesCubit.get(context)
              .fetchcategories(fromPagination: true, category: "science");
        });
      }

      log("$orgsLength");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesStates>(
      listener: (context, state) {
        log("$state");
      },
      builder: (context, state) {
        var cubit = CategoriesCubit.get(context);
        return Scaffold(
          backgroundColor: isDark! ? AppColors.black : AppColors.white,
          appBar: AppBar(
            backgroundColor: isDark! ? AppColors.black : AppColors.white,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                AppRouter.goBack(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: isDark! ? AppColors.white : AppColors.black,
            ),
            title: Text(
              S.of(context).science,
              style: getBoldStyle(
                color: isDark! ? AppColors.white : AppColors.black,
                fontSize: 17,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              BlocBuilder<CategoriesCubit, CategoriesStates>(
                buildWhen: (previous, current) =>
                    current is! CategoryPaginationState,
                builder: (context, state) {
                  if (state is CategoryLoadingState) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: isDark! ? AppColors.white : AppColors.black,
                    ));
                  } else if (state is CategorySuccessState) {
                    return Expanded(
                      child: ListView.separated(
                          controller: scrollController,
                          itemBuilder: (context, index) =>
                              buildNewsCard(context, cubit.categories[index]),
                          separatorBuilder: (context, index) => SizedBox(
                                height: context.height * 0.01,
                              ),
                          itemCount: orgsLength),
                    );
                  } else {
                    return Text(
                      "NO internet Connection",
                      style: getSemiBoldStyle(
                          color: AppColors.black, fontSize: 20),
                    );
                  }
                },
              )
            ]),
          ),
          floatingActionButton: BlocBuilder<CategoriesCubit, CategoriesStates>(
            builder: (context, state) {
              if (state is CategoryPaginationState) {
                return Align(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(25),
                      elevation: 10,
                      child: CircleAvatar(
                          radius: context.height * 0.025,
                          backgroundColor: AppColors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircularProgressIndicator(
                              color: AppColors.black,
                            ),
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
