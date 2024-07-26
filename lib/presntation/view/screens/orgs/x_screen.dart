import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/presntation/manager/cubit/orgnization_cubit.dart';
import 'package:latest_news/presntation/manager/states/orgnizations_states.dart';
import 'package:latest_news/presntation/view/widgets/news_card.dart';

import '../../../../config/routes/app_routs.dart';

class XScreen extends StatefulWidget {
  const XScreen({super.key});

  @override
  State<XScreen> createState() => _XScreenState();
}

class _XScreenState extends State<XScreen> {
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
          OrgnizationCubit.get(context).fetchOrgs(fromPagination: true);
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
          backgroundColor: isDark! ? AppColors.black : AppColors.white,
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
                child: SvgPicture.asset("assets/logos/X_logo_2023.svg"),
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
                      color: isDark! ? AppColors.white : AppColors.black,
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
