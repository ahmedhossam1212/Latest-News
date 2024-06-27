import 'package:flutter/material.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';
import 'package:latest_news/presntation/view/widgets/orgnizations_card.dart';
import 'package:latest_news/presntation/view/widgets/slider.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                "Popular Prganization",
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
                        fun: () {},
                        image: "assets/logos/X_logo_2023.svg",
                        orgName: "X"),
                    SizedBox(
                      width: context.width * 0.02,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
