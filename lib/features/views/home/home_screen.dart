/**
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
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            /// 🔥 APP BAR
            const SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              expandedHeight: 60,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: HomeAppBar(),
              ),
            ),

            /// 🔥 Ad Banner (NOW ABOVE SEARCH BAR)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: AdBannerSection(),
              ),
            ),

            /// 🔥 STICKY SEARCH BAR
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickySearchBarDelegate(),
            ),

            /// 🔥 BODY CONTENT
            SliverPadding(
              padding: const EdgeInsets.only(top: 10),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 18),

                  /// 🎬 Hero Section
                  const HeroSection(),

                  const SizedBox(height: 20),

                  /// ⭐ Popular Movies
                  const PopularMoviesSection(),

                  const SizedBox(height: 30),

                  /// ⭐ TOP 10 WMR LIST
                  const Top10WmrSection(),

                  const SizedBox(height: 20),

                  /// ✨ In the Spotlight
                  const SpotlightSection(),

                  const SizedBox(height: 30),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom delegate for sticky search bar
class _StickySearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: const CustomSearchBar(),
    );
  }

  @override
  double get maxExtent => 70; // Height when fully expanded

  @override
  double get minExtent => 70; // Height when collapsed (same as max for sticky)

  @override
  bool shouldRebuild(covariant _StickySearchBarDelegate oldDelegate) {
    return false;
  }
}