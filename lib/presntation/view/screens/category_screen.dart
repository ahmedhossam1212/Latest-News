import 'package:flutter/material.dart';
import 'package:latest_news/config/network/constanc.dart';
import 'package:latest_news/config/routes/app_routs.dart';
import 'package:latest_news/core/utils/app_colors.dart';
import 'package:latest_news/core/utils/media_query_values.dart';
import 'package:latest_news/generated/l10n.dart';
import 'package:latest_news/presntation/view/widgets/categorys_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark! ? AppColors.black : AppColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              buildCategoryCard(
                  fun: () {
                    AppRouter.goPush(context, AppRouter.sports);
                  },
                  title: S.of(context).sports,
                  discretion: S.of(context).sports_d,
                  image:
                      "https://img.freepik.com/free-photo/sports-tools_53876-138077.jpg?uid=R123558966&ga=GA1.1.889471589.1722604272&semt=sph"),
              SizedBox(height: context.height * 0.06),
              buildCategoryCard(
                  fun: () {
                    AppRouter.goPush(context, AppRouter.science);
                  },
                  title: S.of(context).science,
                  discretion: S.of(context).science_d,
                  image:
                      "https://img.freepik.com/free-photo/viruses-highlighted-by-blue-red-hues-float-cellular-space_157027-4026.jpg?uid=R123558966&ga=GA1.1.889471589.1722604272&semt=sph"),
              SizedBox(height: context.height * 0.06),
              buildCategoryCard(
                  fun: () {
                    AppRouter.goPush(context, AppRouter.business);
                  },
                  title: S.of(context).business,
                  discretion: S.of(context).business_d,
                  image:
                      "https://img.freepik.com/free-photo/millennial-asia-businessmen-businesswomen-meeting-brainstorming-ideas-about-new-paperwork-project-colleagues-working-together-planning-success-strategy-enjoy-teamwork-small-modern-night-office_7861-2386.jpg?uid=R123558966&ga=GA1.1.889471589.1722604272&semt=sph"),
              SizedBox(height: context.height * 0.06),
              buildCategoryCard(
                  fun: () {
                    AppRouter.goPush(context, AppRouter.technology);
                  },
                  title: S.of(context).technology,
                  discretion: S.of(context).technology_d,
                  image:
                      "https://img.freepik.com/free-photo/technology-human-touch-background-modern-remake-creation-adam_53876-129794.jpg?t=st=1722757924~exp=1722761524~hmac=9e3ffdbc22e5d20e9b79734091a287f0b0dc7ce60e9c494b7d1d79380dbce566&w=1800"),
              SizedBox(height: context.height * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
