import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:latest_news/config/routes/app_routs.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/core/utils/style_manager.dart';

List<Widget> sliderList = [
  const HollywoodCard(),
  const GazaCard(),
  const PremierLeagueCard()
];

Widget buildSlider(BuildContext context) => SizedBox(
      height: context.height * 0.35,
      width: double.infinity,
      child: CarouselSlider(
          items: sliderList,
          options: CarouselOptions(
            height: context.height * 0.38,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(seconds: 2),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          )),
    );

class HollywoodCard extends StatelessWidget {
  const HollywoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: context.height * 0.275,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            "assets/images/hollywood.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: context.height * 0.275,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hollywood",
                  style: getBoldStyle(color: AppColors.white, fontSize: 20),
                ),
                Text(
                  "Follow the most important events within the American artistic community",
                  style: getRegularStyle(color: AppColors.white, fontSize: 15),
                ),
                SizedBox(
                  height: context.height * 0.109,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        AppRouter.goPush(context, AppRouter.hollywoodWebV);
                      },
                      color: AppColors.white,
                      child: Text(
                        "More details",
                        style:
                            getBoldStyle(color: AppColors.black, fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class GazaCard extends StatelessWidget {
  const GazaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.height * 0.275,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            "assets/images/Medium_Gaza.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: context.height * 0.275,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "GAZA",
                  style: getBoldStyle(color: AppColors.white, fontSize: 20),
                ),
                Text(
                  "Follow the events of the war in Gaza and the effects of the brutal occupation on civilians",
                  style: getRegularStyle(color: AppColors.white, fontSize: 15),
                ),
                SizedBox(
                  height: context.height * 0.109,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        AppRouter.goPush(context, AppRouter.gazaWebV);
                      },
                      color: AppColors.white,
                      child: Text(
                        "More details",
                        style:
                            getBoldStyle(color: AppColors.black, fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PremierLeagueCard extends StatelessWidget {
  const PremierLeagueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.height * 0.275,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            "assets/images/premier_league.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: context.height * 0.275,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Premier League",
                  style: getBoldStyle(color: AppColors.white, fontSize: 20),
                ),
                Text(
                  "The events of the English Premier League have become interesting. Take a look",
                  style: getRegularStyle(color: AppColors.white, fontSize: 15),
                ),
                SizedBox(
                  height: context.height * 0.109,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        AppRouter.goPush(context, AppRouter.premierLeagueWebV);
                      },
                      color: AppColors.white,
                      child: Text(
                        "More details",
                        style:
                            getBoldStyle(color: AppColors.black, fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
