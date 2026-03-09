import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/custom_background.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: SafeArea(
          child: Column(
            children: [
              /// HEADER
              _buildHeader(context),

              /// CONTENT
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// SECTION TITLE WITH SORT
                      _buildSectionHeader(),

                      const SizedBox(height: 16),

                      /// MOVIE LIST
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return _buildMovieCard(index + 1);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///-------------------------- HEADER WITH BACK BUTTON AND TITLE
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
                const SizedBox(width: 8),
                 Text(
                  'UMR LEADERBOARD',
                  style: AppTextStyle.largeHeadingFranchise
                ),
                const SizedBox(width: 8),
                SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
              ],
            ),
          ),
          const SizedBox(width: 44), // Balance the back button
        ],
      ),
    );
  }

  /// SECTION HEADER WITH SORT OPTIONS
  Widget _buildSectionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Top Rated Movies',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sort By Rating',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.arrow_drop_down, color: Colors.white, size: 16),
            SizedBox(width: 8),
            Text(
              '1-100',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_drop_down, color: Colors.white, size: 16),
          ],
        ),
      ],
    );
  }

  /// MOVIE CARD
  Widget _buildMovieCard(int rank) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          /// MOVIE POSTER WITH PLUS ICON
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/movie_poster.png',
                  width: 90,
                  height: 130,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 90,
                    height: 130,
                    color: const Color(0xFF334155),
                    child: const Icon(
                      Icons.movie,
                      color: Colors.white38,
                      size: 40,
                    ),
                  ),
                ),
              ),
              /// PLUS ICON OVERLAY
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: SvgPicture.asset("assets/icons/bookmark_add.svg",height: 30,width: 30,),
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          /// MOVIE INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// RANK BADGE
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE05A2B),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '#$rank',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// MOVIE TITLE
                const Text(
                  'Spider-Man: Across the Spider-Verse',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 8),

                /// MOVIE DETAILS
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/rate_fill.svg",
                      height: 20, // REQUIRED: Specify size
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '8.5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildDot(),
                    const SizedBox(width: 8),
                    const Text(
                      'Movie',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildDot(),
                    const SizedBox(width: 8),
                    const Text(
                      '2018',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildDot(),
                    const SizedBox(width: 8),
                    const Text(
                      '2hr 30min',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot() {
    return Container(
      width: 4,
      height: 4,
      decoration: const BoxDecoration(
        color: Colors.white54,
        shape: BoxShape.circle,
      ),
    );
  }
}
