import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/presntation/manager/cubit/orgnization_cubit.dart';
import 'package:latest_news/presntation/manager/states/orgnizations_states.dart';
import 'package:latest_news/presntation/view/widgets/news_card.dart';

import '../../../../config/routes/app_routs.dart';

class BMWScreen extends StatefulWidget {
  const BMWScreen({super.key});

  @override
  State<BMWScreen> createState() => _BMWScreenState();
}

class _BMWScreenState extends State<BMWScreen> {
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
          OrgnizationCubit.get(context)
              .fetchOrgs(fromPagination: true, org: "BMW");
        });
      }

      log("$orgsLength");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrgnizationCubit, OrgnizationsStates>(
      listener: (context, state) {
        log("$state");
      },
      builder: (context, state) {
        var cubit = OrgnizationCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  AppRouter.goBack(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
            title: CircleAvatar(
              radius: 35,
              backgroundColor: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset("assets/logos/bmw-svgrepo-com.svg"),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              BlocBuilder<OrgnizationCubit, OrgnizationsStates>(
                buildWhen: (previous, current) =>
                    current is! OrgPaginationState,
                builder: (context, state) {
                  if (state is OrgLoadingState) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppColors.black,
                    ));
                  } else if (state is OrgSuccessState) {
                    return Expanded(
                      child: ListView.separated(
                          controller: scrollController,
                          itemBuilder: (context, index) =>
                              buildNewsCard(context, cubit.orgs[index]),
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
          floatingActionButton:
              BlocBuilder<OrgnizationCubit, OrgnizationsStates>(
            builder: (context, state) {
              if (state is OrgPaginationState) {
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
