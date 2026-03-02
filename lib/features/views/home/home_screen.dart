/**
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';
import '../../widgets/content_card.dart';
import '../../widgets/custom_search_bar.dart';
import '../../widgets/home_widget/wmr_filter_tabs.dart';
import '../../widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedFilter = 'Today';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/noise_background_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        /// 🔥 APP BAR
        appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 80,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Image.asset('assets/images/logo.png'),
          ),
          actions: [
            SvgPicture.asset(
              "assets/icons/notification.svg",
              height: 22,
              color: Colors.white,
            ),
            const SizedBox(width: 16),
            const CircleAvatar(
              radius: 22,
              foregroundImage: AssetImage("assets/images/demo_user.jpg"),
            ),
            const SizedBox(width: 16),
          ],
        ),

        /// 🔥 BODY
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                /// 🔥 Ad Banner
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/ad_banner.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                /// 🔎 Search Bar
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomSearchBar(),
                ),

                const SizedBox(height: 20),

                /// 🎬 Hero Section
                Image.asset(
                  "assets/images/hero_section.png",
                  fit: BoxFit.cover,
                ),

                const SizedBox(height: 20),

                /// ⭐ POPULAR TITLE
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/star_with_background_shade.svg",
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Popular",
                      style: AppTextStyle.largeHeadingFranchise,
                    ),
                    const SizedBox(width: 20),
                    SvgPicture.asset(
                      "assets/icons/star_with_background_shade.svg",
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// 🎥 HORIZONTAL MOVIE LIST
                SizedBox(
                  height: 430,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 5,
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      return MovieCard(
                        imagePath: "assets/images/movie_poster.png",
                        title: "Stranger Things",
                        type: "TV Series",
                        year: "2016-2025",
                        duration: "1h",
                        rating: 8.5,
                        genres: const ["Kdrama", "Thriller", "Fantasy"],
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                /// ⭐ TOP 10 WMR LIST SECTION - WITH IMAGES
                Column(
                  children: [
                    /// Title with stars
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/star_with_background_shade.svg",
                        ),
                        const SizedBox(width: 20),
                        Text(
                          "TOP 10 WMR LIST",
                          style: AppTextStyle.largeHeadingFranchise,
                        ),
                        const SizedBox(width: 20),
                        SvgPicture.asset(
                          "assets/icons/star_with_background_shade.svg",
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// Today - Week - Month Filter
                    FilterTabs(
                      selectedFilter: selectedFilter,
                      onFilterSelected: (newFilter) {
                        setState(() => selectedFilter = newFilter);
                      },
                      indicatorColor: Colors.white.withValues(alpha: 0.3),
                      indicatorHeight: 2,
                      spacing: 30,
                    ),
                    const SizedBox(height: 20),

                    /// 🔥 HORIZONTALLY SCROLLABLE CONTENT CARDS WITH IMAGES
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 300,
                            margin: EdgeInsets.only(
                              left: index == 0 ? 0 : 12,
                            ),
                            child: ContentCard(
                              number: '${index + 1}'.padLeft(2, '0'),
                              title: 'The Strangers',
                              series: 'Things : Season 1',
                              rating: '8.5',
                              year: '2021',
                              imagePath: 'assets/images/movie_poster.png', // Add your image path here
                              onTap: () {
                                print('Card ${index + 1} tapped!');
                              },
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    /// Title with stars
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/star_with_background_shade.svg",
                        ),
                        const SizedBox(width: 20),
                        Text(
                          "In the spotlight",
                          style: AppTextStyle.largeHeadingFranchise,
                        ),
                        const SizedBox(width: 20),
                        SvgPicture.asset(
                          "assets/icons/star_with_background_shade.svg",
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/






import 'package:flutter/material.dart';
import 'package:woke_movie_rating/features/views/home/popular_movies_section.dart';
import 'package:woke_movie_rating/features/views/home/spotlight_section.dart';
import 'package:woke_movie_rating/features/views/home/top_10_wmr_section.dart';
import '../../widgets/home_widget/custom_search_bar.dart';
import 'ad_banner_section.dart';
import 'hero_section.dart';
import 'home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/noise_background_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        /// 🔥 APP BAR
        appBar: const HomeAppBar(),

        /// 🔥 BODY
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),

                /// 🔥 Ad Banner
                AdBannerSection(),

                SizedBox(height: 18),

                /// 🔎 Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomSearchBar(),
                ),

                SizedBox(height: 20),

                /// 🎬 Hero Section
                HeroSection(),

                SizedBox(height: 20),

                /// ⭐ Popular Movies
                PopularMoviesSection(),

                SizedBox(height: 30),

                /// ⭐ TOP 10 WMR LIST
                Top10WmrSection(),

                SizedBox(height: 20),

                /// ✨ In the Spotlight
                SpotlightSection(),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}