import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latest_news/config/routes/app_routs.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/presntation/manager/cubit/orgnizations_cubit.dart';
import 'package:latest_news/presntation/manager/states/orgnizations_states.dart';
import 'package:latest_news/presntation/view/widgets/news_card.dart';

class OrgnizationNews extends StatefulWidget {
  const OrgnizationNews({super.key, required this.name});

  final String name;

  @override
  State<OrgnizationNews> createState() => _OrgnizationNewsState();
}

class _OrgnizationNewsState extends State<OrgnizationNews> {
  final scrollController = ScrollController();
  int xNewsLength = 5;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollLisntner);
  }

  void scrollLisntner() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (xNewsLength < 20) {
        setState(() {
          xNewsLength = xNewsLength + 5;
          OrgnizationsCubit()
              .get(context)
              .getOrgs(orgnization: widget.name, fromPagination: true);
        });
        log("$xNewsLength");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrgnizationsCubit()
        ..getOrgs(orgnization: widget.name, fromPagination: false),
      child: BlocConsumer<OrgnizationsCubit, OrgnizationsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = OrgnizationsCubit().get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    AppRouter.goBack(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              title: Row(
                children: [
                  Text(
                    widget.name,
                    style: getBoldStyle(color: AppColors.black, fontSize: 25),
                  )
                ],
              ),
            ),
            body: BlocBuilder<OrgnizationsCubit, OrgnizationsStates>(
              buildWhen: (previous, current) => current is! OrgPaginationState,
              builder: (context, state) {
                if (state is OrgLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.black,
                    ),
                  );
                } else {
                  return Expanded(
                      child: ListView.separated(
                          controller: scrollController,
                          padding: const EdgeInsets.all(20),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => buildNewsCard(
                                context,
                                cubit.orgnizations[index],
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: context.height * 0.02,
                              ),
                          itemCount: xNewsLength));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
