/**
    import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    import 'package:flutter_svg/flutter_svg.dart';
    import 'package:woke_movie_rating/features/utils/app_colors.dart';
    import 'package:woke_movie_rating/features/utils/app_text_styles.dart';
    import '../../widgets/custom_background.dart';

    class MovieDetailsScreen extends StatelessWidget {
    const MovieDetailsScreen({super.key});

    @override
    Widget build(BuildContext context) {
    return Scaffold(
    body: CustomBackground(
    child: CustomScrollView(
    slivers: [
    /// SLIVER APP BAR WITH BACKGROUND IMAGE
    SliverAppBar(
    expandedHeight: 320,
    floating: false,
    pinned: false,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    leading: Padding(
    padding: const EdgeInsets.only(left: 12.0, top: 8),
    child: GestureDetector(
    onTap: () => Navigator.pop(context),
    child: Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.1),
    borderRadius: BorderRadius.circular(8),
    ),
    child: const Icon(
    Icons.arrow_back_ios_new,
    color: Colors.white,
    size: 18,
    ),
    ),
    ),
    ),
    flexibleSpace: FlexibleSpaceBar(
    background: Stack(
    fit: StackFit.expand,
    children: [
    /// BACKGROUND IMAGE ONLY IN APP BAR
    Image.asset(
    'assets/images/movie_poster.png',
    fit: BoxFit.cover,
    ),

    /// DARK OVERLAY
    Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
    Colors.black.withOpacity(0.6),
    Colors.black.withOpacity(0.7),
    const Color(0xFF0D1F33),
    ],
    ),
    ),
    ),

    /// CONTENT
    SafeArea(
    child: Padding(
    padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const SizedBox(height: 20),

    /// Movie Poster and Info Row
    Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    /// MOVIE POSTER
    ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Image.asset(
    'assets/images/movie_poster.png',
    width: 130,
    height: 220,
    fit: BoxFit.cover,
    errorBuilder:
    (context, error, stackTrace) =>
    Container(
    width: 130,
    height: 190,
    color: const Color(0xFF1E293B),
    child: const Icon(
    Icons.movie,
    color: Colors.white38,
    size: 48,
    ),
    ),
    ),
    ),

    const SizedBox(width: 14),

    /// Title and Info (right side)
    Expanded(
    child: Column(
    crossAxisAlignment:
    CrossAxisAlignment.start,
    children: [
    /// TITLE
    Row(
    children: [
    Text(
    'THE OFFICE',
    style: AppTextStyle
    .largeHeadingFranchise.copyWith(
    fontSize: 40
    ),
    ),
    const SizedBox(width: 8,),
    SvgPicture.asset("assets/icons/woke_alert.svg",height: 40,width: 40,)
    ],
    ),

    const SizedBox(height: 8),

    /// SUBTITLE
    const Text(
    'TV Series • S1-S9 • 22m',
    style: TextStyle(
    color: Colors.white70,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    ),
    ),

    const SizedBox(height: 16),

    /// Rating and Watch Trailer Row
    Row(
    children: [
    /// RATING BADGE - CIRCLE
    Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
    color: const Color(0xFFE05A2B),
    shape: BoxShape.circle,
    border: Border.all(
    color: Colors.white.withOpacity(
    0.3,
    ),
    width: 2,
    ),
    ),
    child: const Center(
    child: Text(
    '8.5',
    style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ),

    const SizedBox(width: 12),

    /// WATCH TRAILER BUTTON
    ElevatedButton(
    onPressed: () {
    // Add your onTap functionality here
    print('Watch Trailer tapped');
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.mainBottomNavColor,
    foregroundColor: AppColors.whiteColor,
    padding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
    ),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
    side: BorderSide(
    color: AppColors.borderColor
    ),
    ),
    elevation: 0,
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min, // Important to prevent full width stretching
    children: [
    Text(
    'Watch Trailer',
    style: AppTextStyle.smallText,
    ),
    const SizedBox(width: 8),
    const Icon(
    Icons.play_arrow,
    color: Colors.white,
    size: 14,
    ),
    ],
    ),
    ),

    ],
    ),

    const SizedBox(height: 16),

    /// ACTION BUTTONS
    Row(
    children: [
    _buildActionButton(
    CupertinoIcons.checkmark_alt,
    ),
    const SizedBox(width: 10),
    _buildActionButton(
    Icons.favorite_border,
    ),
    const SizedBox(width: 10),
    _buildActionButton(
    Icons.bookmark_add_outlined,
    ),
    ],
    ),
    ],
    ),
    ),
    ],
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    ),
    ),

    /// CONTENT SLIVER - With CustomBackground showing through
    SliverPadding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
    sliver: SliverList(
    delegate: SliverChildListDelegate([
    /// DECORATIVE STARS LINE
    _buildStarsDivider(),
    const SizedBox(height: 28),

    Padding(
    padding: const EdgeInsets.only(left: 16, right: 16),
    child: Column(
    children: [
    /// OVERVIEW SECTION
    _buildOverviewSection(),

    const SizedBox(height: 28),

    /// CAST SECTION
    _buildCastSection(),

    const SizedBox(height: 28),

    /// ALL SEASONS SECTION
    _buildAllSeasonsSection(),

    const SizedBox(height: 28),

    /// UMR RATINGS SECTION
    _buildUmrRatingsSection(),

    const SizedBox(height: 28),

    /// USER REVIEW SECTION
    _buildUserReviewSection(),

    const SizedBox(height: 28),

    /// RECOMMENDATIONS SECTION - HORIZONTAL SCROLL
    _buildRecommendationsSection(),
    ],
    ),
    ),
    ]),
    ),
    ),
    ],
    ),
    ),
    );
    }

    Widget _buildActionButton(IconData icon) {
    return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
    color: AppColors.borderColor,
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white.withOpacity(0.2)),
    ),
    child: Icon(icon, color: Colors.white, size: 22),
    );
    }

    /// STARS DIVIDER
    Widget _buildStarsDivider() {
    return Container(
    height: 30,
    decoration: const BoxDecoration(color: Color(0xFF8B2635)),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(
    15,
    (index) => const Icon(Icons.star, color: Colors.white, size: 16),
    ),
    ),
    );
    }

    /// OVERVIEW SECTION
    Widget _buildOverviewSection() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
    const SizedBox(width: 10),
    Text(
    'OVERVIEW',
    style: AppTextStyle.largeHeadingFranchise,
    ),
    ],
    ),

    const SizedBox(height: 14),

    const Text(
    'A mockumentary on a group of typical office workers, where the workday consists of ego clashes, inappropriate behavior, tedium and romance. A mockumentary on a group of typical office workers, where the workday consists of ego clashes, inappropriate behavior, tedium and romance.',
    style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.6),
    ),
    ],
    );
    }

    /// CAST SECTION
    Widget _buildCastSection() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
    const SizedBox(width: 10),
    Text(
    'CAST',
    style: AppTextStyle.largeHeadingFranchise,
    ),
    ],
    ),

    const SizedBox(height: 16),

    SizedBox(
    height: 140,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 6,
    itemBuilder: (context, index) {
    return Container(
    width: 110,
    margin: const EdgeInsets.only(right: 12),
    child: Column(
    children: [
    const CircleAvatar(
    radius: 40,
    backgroundColor: Color(0xFF1E293B),
    backgroundImage: AssetImage(
    'assets/images/demo_user.jpg',
    ),
    ),
    const SizedBox(height: 8),
    const Text(
    'Rainn Wilson',
    style: TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    ),
    textAlign: TextAlign.center,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    ),
    const SizedBox(height: 4),
    const Text(
    'Dwight Schrute',
    style: TextStyle(color: Colors.white54, fontSize: 11),
    textAlign: TextAlign.center,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    ),
    ],
    ),
    );
    },
    ),
    ),
    ],
    );
    }

    /// ALL SEASONS SECTION
    Widget _buildAllSeasonsSection() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
    const SizedBox(width: 10),
    Text(
    'ALL SEASONS',
    style: AppTextStyle.largeHeadingFranchise,
    ),
    ],
    ),

    const SizedBox(height: 16),

    SizedBox(
    height: 220,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5,
    itemBuilder: (context, index) {
    return Container(
    width: 140,
    margin: const EdgeInsets.only(right: 12),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Expanded(
    child: Stack(
    children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.asset(
    'assets/images/movie_poster.png',
    width: 140,
    height: 160,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) =>
    Container(
    width: 140,
    height: 160,
    color: const Color(0xFF1E293B),
    child: const Icon(
    Icons.movie,
    color: Colors.white38,
    size: 32,
    ),
    ),
    ),
    ),
    Positioned(
    bottom: 8,
    right: 8,
    child: Container(
    padding: const EdgeInsets.symmetric(
    horizontal: 6,
    vertical: 3,
    ),
    decoration: BoxDecoration(
    color: const Color(0xFFE05A2B),
    borderRadius: BorderRadius.circular(6),
    ),
    child: const Text(
    '8.5',
    style: TextStyle(
    color: Colors.white,
    fontSize: 11,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ),
    ],
    ),
    ),

    const SizedBox(height: 8),

    const Text(
    'Season 1',
    style: TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    ),
    ),
    const SizedBox(height: 2),
    const Text(
    '2005 • 6 Episodes',
    style: TextStyle(color: Colors.white54, fontSize: 11),
    ),
    ],
    ),
    );
    },
    ),
    ),
    ],
    );
    }

    /// UMR RATINGS SECTION
    Widget _buildUmrRatingsSection() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
    const SizedBox(width: 10),
    Text(
    'UMR RATINGS',
    style: AppTextStyle.largeHeadingFranchise,
    ),
    const Spacer(),
    GestureDetector(
    child: Row(
    children: [
    Icon(Icons.add,color: AppColors.redColor,),
    const SizedBox(width: 4),
    const Text(
    'Add Your Rating',
    style: TextStyle(color: Color(0xFFE05A2B), fontSize: 12),
    ),
    ],
    ),
    ),
    ],
    ),

    const SizedBox(height: 20),

    Row(
    children: [
    /// BIG RATING
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    children: [
    Text(
    '09',
    style: TextStyle(
    color: Colors.white,
    fontSize: 48,
    fontWeight: FontWeight.bold,
    ),
    ),
    Text(
    '/10',
    style: TextStyle(
    color: Colors.white54,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    ),
    ),
    ],
    ),
    const SizedBox(height: 8),
    Row(
    children: List.generate(
    5,
    (index) => const Icon(
    Icons.star,
    color: Color(0xFFE05A2B),
    size: 18,
    ),
    ),
    ),
    const SizedBox(height: 4),
    const Text(
    'By 1.9k users',
    style: TextStyle(color: Colors.white54, fontSize: 12),
    ),
    ],
    ),

    const SizedBox(width: 24),

    /// RATING BARS
    Expanded(
    child: Column(
    children: List.generate(
    10,
    (index) => Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Row(
    children: [
    Text(
    '${10 - index}',
    style: const TextStyle(
    color: Colors.white54,
    fontSize: 10,
    ),
    ),
    const SizedBox(width: 8),
    Expanded(
    child: Container(
    height: 6,
    decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.1),
    borderRadius: BorderRadius.circular(3),
    ),
    child: Row(
    children: [
    Container(
    width: 100 - (index * 8).toDouble(),
    height: 6,
    decoration: BoxDecoration(
    color: index < 3
    ? const Color(0xFFE05A2B)
    : Colors.white.withOpacity(0.3),
    borderRadius: BorderRadius.circular(3),
    ),
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    ),
    ),
    ],
    ),
    ],
    );
    }

    /// USER REVIEW SECTION
    Widget _buildUserReviewSection() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
    const SizedBox(width: 10),
    Text(
    'USER REVIEW',
    style: AppTextStyle.largeHeadingFranchise,
    ),
    ],
    ),

    const SizedBox(height: 20),

    /// ADD REVIEW SECTION
    Row(
    children: [
    const CircleAvatar(
    radius: 28,
    backgroundImage: AssetImage('assets/images/demo_user.jpg'),
    ),
    const SizedBox(width: 12),
    Expanded(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text(
    'Add Your Review',
    style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    ),
    ),
    const SizedBox(height: 4),
    Container(height: 1, color: Colors.white.withOpacity(0.3)),
    ],
    ),
    ),
    ],
    ),

    const SizedBox(height: 24),

    /// REVIEW LIST
    ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 3,
    itemBuilder: (context, index) {
    return Padding(
    padding: const EdgeInsets.only(bottom: 24),
    child: _buildReviewCard(),
    );
    },
    ),

    /// LOAD MORE BUTTON
    Center(
    child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.15),
    borderRadius: BorderRadius.circular(25),
    ),
    child: const Text(
    'Load More',
    style: TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    ),
    ),
    ),
    ),
    ],
    );
    }

    /// RECOMMENDATIONS SECTION - HORIZONTAL SCROLL
    Widget _buildRecommendationsSection() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    /// RECOMMENDATIONS HEADER WITH STAR ICON
    Row(
    children: [
    SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
    const SizedBox(width: 10),
    Text(
    'RECOMMENDATIONS',
    style: AppTextStyle.largeHeadingFranchise,
    ),
    ],
    ),

    const SizedBox(height: 16),

    /// HORIZONTAL SCROLLING RECOMMENDATIONS
    SizedBox(
    height: 220,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 9,
    itemBuilder: (context, index) {
    return Container(
    width: 140,
    margin: const EdgeInsets.only(right: 12),
    child: _buildRecommendationItem(index),
    );
    },
    ),
    ),
    ],
    );
    }

    Widget _buildRecommendationItem(int index) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    /// POSTER WITH RATING BADGE AND KHOI CHIEU OVERLAY
    Expanded(
    child: Stack(
    children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.asset(
    'assets/images/movie_poster.png',
    width: double.infinity,
    height: double.infinity,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) => Container(
    width: double.infinity,
    height: double.infinity,
    color: const Color(0xFF1E293B),
    child: const Icon(
    Icons.movie,
    color: Colors.white38,
    size: 32,
    ),
    ),
    ),
    ),

    /// RATING BADGE (BOTTOM RIGHT)
    Positioned(
    bottom: 8,
    right: 8,
    child: Container(
    padding: const EdgeInsets.symmetric(
    horizontal: 6,
    vertical: 3,
    ),
    decoration: BoxDecoration(
    color: const Color(0xFFE05A2B),
    borderRadius: BorderRadius.circular(6),
    ),
    child: const Text(
    '09',
    style: TextStyle(
    color: Colors.white,
    fontSize: 11,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ),

    /// KHOI CHIEU TEXT OVERLAY (TOP LEFT)
    /// This appears on all items as shown in your reference image
    Positioned(
    top: 8,
    left: 8,
    child: Container(
    padding: const EdgeInsets.symmetric(
    horizontal: 6,
    vertical: 3,
    ),
    decoration: BoxDecoration(
    color: Colors.black.withOpacity(0.7),
    borderRadius: BorderRadius.circular(4),
    ),
    child: const Text(
    'KHOI CHIEU 28.02',
    style: TextStyle(
    color: Colors.white,
    fontSize: 8,
    fontWeight: FontWeight.w600,
    ),
    ),
    ),
    ),
    ],
    ),
    ),

    const SizedBox(height: 8),

    /// MOVIE TITLE
    const Text(
    'INTERSHELLAR',
    style: TextStyle(
    color: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    ),

    const SizedBox(height: 2),

    /// RELEASE DATE
    const Text(
    'KHOI CHIEU 28.02',
    style: TextStyle(
    color: Colors.white54,
    fontSize: 9,
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    ),
    ],
    );
    }

    Widget _buildReviewCard() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    const CircleAvatar(
    radius: 28,
    backgroundImage: AssetImage('assets/images/demo_user.jpg'),
    ),
    const SizedBox(width: 12),
    Expanded(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    const Text(
    'Farhan Hasan',
    style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    ),
    ),
    const SizedBox(width: 8),
    const Text(
    'Follow',
    style: TextStyle(
    color: Color(0xFFE05A2B),
    fontSize: 15,
    fontWeight: FontWeight.w600,
    ),
    ),
    ],
    ),
    const SizedBox(height: 4),
    const Text(
    'Updated on 23 Nov, 2025',
    style: TextStyle(color: Colors.white54, fontSize: 13),
    ),
    ],
    ),
    ),
    ],
    ),
    const SizedBox(height: 12),
    const Text(
    'Such an incredible show. Probably my favorite show of all time. The characters and office environment is easy to relate to.',
    style: TextStyle(color: Colors.white, fontSize: 14, height: 1.5),
    ),
    ],
    );
    }
    }*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';
import 'package:woke_movie_rating/features/widgets/custom_background.dart';
import '../../widgets/details_screen_widget/rating_bar_widget.dart';
import '../../widgets/details_screen_widget/review_card.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  int? _userRating;
  double _averageRating = 8.5;
  int _totalRatings = 1900;

  // Sample rating distribution data
  final List<int> _ratingDistribution = [
    45,
    38,
    42,
    58,
    85,
    120,
    210,
    320,
    450,
    532,
  ];

  void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF1A1F2E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: MovieRatingWidget(),
          ),
        );
      },
    ).then((selectedRating) {
      if (selectedRating != null) {
        setState(() {
          _userRating = selectedRating;
          // Update average rating (this is just for demo)
          _totalRatings += 1;
          _averageRating =
              ((_averageRating * (_totalRatings - 1) + selectedRating) /
              _totalRatings);
        });

        // Show confirmation snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'You rated this movie $_userRating/10',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            backgroundColor: AppColors.redColor,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: CustomScrollView(
          slivers: [
            /// SLIVER APP BAR WITH BACKGROUND IMAGE
            SliverAppBar(
              expandedHeight: 320,
              floating: false,
              pinned: false,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 8),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    /// BACKGROUND IMAGE ONLY IN APP BAR
                    Image.asset(
                      'assets/images/movie_poster.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: const Color(0xFF1E293B),
                        child: const Center(
                          child: Icon(
                            Icons.movie,
                            color: Colors.white38,
                            size: 80,
                          ),
                        ),
                      ),
                    ),

                    /// DARK OVERLAY
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.7),
                            const Color(0xFF0D1F33),
                          ],
                        ),
                      ),
                    ),

                    /// CONTENT
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),

                            /// Movie Poster and Info Row
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// MOVIE POSTER
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    'assets/images/movie_poster.png',
                                    width: 130,
                                    height: 190,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                              width: 130,
                                              height: 190,
                                              color: const Color(0xFF1E293B),
                                              child: const Icon(
                                                Icons.movie,
                                                color: Colors.white38,
                                                size: 48,
                                              ),
                                            ),
                                  ),
                                ),

                                const SizedBox(width: 14),

                                /// Title and Info (right side)
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /// TITLE
                                      Row(
                                        children: [
                                          Text(
                                            'THE OFFICE',
                                            style: AppTextStyle
                                                .largeHeadingFranchise
                                                .copyWith(fontSize: 40),
                                          ),
                                          const SizedBox(width: 8),
                                          SvgPicture.asset(
                                            "assets/icons/woke_alert.svg",
                                            height: 40,
                                            width: 40,
                                            placeholderBuilder: (context) =>
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  color: Colors.transparent,
                                                ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 8),

                                      /// SUBTITLE
                                      const Text(
                                        'TV Series • S1-S9 • 22m',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                      const SizedBox(height: 16),

                                      /// Rating and Watch Trailer Row
                                      Row(
                                        children: [
                                          /// RATING BADGE - CIRCLE
                                          Container(
                                            width: 48,
                                            height: 48,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE05A2B),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white.withOpacity(
                                                  0.3,
                                                ),
                                                width: 2,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                _averageRating.toStringAsFixed(
                                                  1,
                                                ),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),

                                          const SizedBox(width: 12),

                                          /// WATCH TRAILER BUTTON
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                HapticFeedback.lightImpact();
                                                print('Watch Trailer tapped');
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: AppColors
                                                    .mainBottomNavColor,
                                                foregroundColor:
                                                    AppColors.whiteColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 12,
                                                    ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  side: BorderSide(
                                                    color:
                                                        AppColors.borderColor,
                                                  ),
                                                ),
                                                elevation: 0,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Watch Trailer',
                                                    style:
                                                        AppTextStyle.smallText,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  const Icon(
                                                    Icons.play_arrow,
                                                    color: Colors.white,
                                                    size: 14,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 16),

                                      /// ACTION BUTTONS
                                      Row(
                                        children: [
                                          _buildActionButton(
                                            CupertinoIcons.checkmark_alt,
                                          ),
                                          const SizedBox(width: 10),
                                          _buildActionButton(
                                            Icons.favorite_border,
                                          ),
                                          const SizedBox(width: 10),
                                          _buildActionButton(
                                            Icons.bookmark_add_outlined,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// CONTENT SLIVER - With CustomBackground showing through
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  /// DECORATIVE STARS LINE
                  _buildStarsDivider(),
                  const SizedBox(height: 28),

                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        /// OVERVIEW SECTION
                        _buildOverviewSection(),

                        const SizedBox(height: 28),

                        /// CAST SECTION
                        _buildCastSection(),

                        const SizedBox(height: 28),

                        /// ALL SEASONS SECTION
                        _buildAllSeasonsSection(),

                        const SizedBox(height: 28),

                        /// UMR RATINGS SECTION
                        _buildUmrRatingsSection(),

                        const SizedBox(height: 28),

                        /// USER REVIEW SECTION
                        _buildUserReviewSection(),

                        const SizedBox(height: 28),

                        /// RECOMMENDATIONS SECTION - HORIZONTAL SCROLL
                        _buildRecommendationsSection(),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.borderColor,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }

  /// STARS DIVIDER
  Widget _buildStarsDivider() {
    return Container(
      height: 30,
      decoration: const BoxDecoration(color: Color(0xFF8B2635)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          15,
          (index) => const Icon(Icons.star, color: Colors.white, size: 16),
        ),
      ),
    );
  }

  /// OVERVIEW SECTION
  Widget _buildOverviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/star_with_background_shade.svg",
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 10),
            Text('OVERVIEW', style: AppTextStyle.largeHeadingFranchise),
          ],
        ),

        const SizedBox(height: 14),

        const Text(
          'A mockumentary on a group of typical office workers, where the workday consists of ego clashes, inappropriate behavior, tedium and romance. A mockumentary on a group of typical office workers, where the workday consists of ego clashes, inappropriate behavior, tedium and romance.',
          style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.6),
        ),
      ],
    );
  }

  /// CAST SECTION
  Widget _buildCastSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/star_with_background_shade.svg",
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 10),
            Text('CAST', style: AppTextStyle.largeHeadingFranchise),
          ],
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                width: 110,
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF1E293B),
                        image: DecorationImage(
                          image: AssetImage('assets/images/demo_user.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Rainn Wilson',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Dwight Schrute',
                      style: TextStyle(color: Colors.white54, fontSize: 11),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// ALL SEASONS SECTION
  Widget _buildAllSeasonsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/star_with_background_shade.svg",
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 10),
            Text('ALL SEASONS', style: AppTextStyle.largeHeadingFranchise),
          ],
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: 140,
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/movie_poster.png',
                              width: 140,
                              height: 160,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                    width: 140,
                                    height: 160,
                                    color: const Color(0xFF1E293B),
                                    child: const Icon(
                                      Icons.movie,
                                      color: Colors.white38,
                                      size: 32,
                                    ),
                                  ),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE05A2B),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                '8.5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Season 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      '2005 • 6 Episodes',
                      style: TextStyle(color: Colors.white54, fontSize: 11),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// UMR RATINGS SECTION
  Widget _buildUmrRatingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/star_with_background_shade.svg",
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 10),
            Text('UMR RATINGS', style: AppTextStyle.largeHeadingFranchise),
            const Spacer(),
            GestureDetector(
              onTap: () => _showRatingDialog(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Row(
                  children: [
                    Icon(Icons.add, color: AppColors.redColor, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      _userRating != null ? 'Update Rating' : 'Add Your Rating',
                      style: const TextStyle(
                        color: Color(0xFFE05A2B),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        if (_userRating != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.redColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.redColor.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Color(0xFFE05A2B), size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Your Rating: $_userRating/10',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

        Row(
          children: [
            /// BIG RATING
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      _averageRating.toInt() < 10
                          ? '0${_averageRating.toInt()}'
                          : _averageRating.toInt().toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '/10',
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color: index < (_averageRating / 2).floor()
                          ? const Color(0xFFE05A2B)
                          : Colors.white24,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'By ${_totalRatings >= 1000 ? '${(_totalRatings / 1000).toStringAsFixed(1)}k' : _totalRatings} users',
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),

            const SizedBox(width: 24),

            /// RATING BARS
            Expanded(
              child: Column(
                children: List.generate(10, (index) {
                  int ratingValue = 10 - index;
                  int barWidth = _ratingDistribution[ratingValue - 1];
                  double maxWidth = _ratingDistribution
                      .reduce((a, b) => a > b ? a : b)
                      .toDouble();
                  double barPercentage = barWidth / maxWidth * 100;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          ratingValue.toString(),
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: barPercentage,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: ratingValue > 7
                                        ? const Color(0xFFE05A2B)
                                        : ratingValue > 4
                                        ? Colors.orange.withOpacity(0.7)
                                        : Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          barWidth.toString(),
                          style: const TextStyle(
                            color: Colors.white38,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// USER REVIEW SECTION
  Widget _buildUserReviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/star_with_background_shade.svg",
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 10),
            Text('USER REVIEW', style: AppTextStyle.largeHeadingFranchise),
          ],
        ),

        const SizedBox(height: 20),

        /// ADD REVIEW SECTION
        GestureDetector(
          onTap: () {
            HapticFeedback.lightImpact();
            // Navigate to add review screen or show dialog
            print('Add review tapped');
          },
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/demo_user.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Your Review',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(height: 1, color: Colors.white.withOpacity(0.3)),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        /// REVIEW LIST
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: ReviewCard(
                name: 'Farhan Hasan',
                imagePath: 'assets/images/demo_user.jpg',
                date: '23 NOv, 2025',
                reviewText:
                    'Such an incredible show. Probably my favorite show of all time. The characters and office environment is easy to relate to. The humor is timeless and the character development throughout the seasons is amazing.',
              ),
            );
          },
        ),

        /// LOAD MORE BUTTON
        Center(
          child: GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              print('Load more reviews');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: const Text(
                'Load More',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// RECOMMENDATIONS SECTION - HORIZONTAL SCROLL
  Widget _buildRecommendationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// RECOMMENDATIONS HEADER WITH STAR ICON
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/star_with_background_shade.svg",
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 10),
            Text('RECOMMENDATIONS', style: AppTextStyle.largeHeadingFranchise),
          ],
        ),

        const SizedBox(height: 16),

        /// HORIZONTAL SCROLLING RECOMMENDATIONS
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 9,
            itemBuilder: (context, index) {
              return Container(
                width: 140,
                margin: const EdgeInsets.only(right: 12),
                child: _buildRecommendationItem(index),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendationItem(int index) {
    List<String> movieTitles = [
      'INTERSTELLAR',
      'INCEPTION',
      'THE DARK KNIGHT',
      'TENET',
      'DUNKIRK',
      'OPPENHEIMER',
      'MEMENTO',
      'PRESTIGE',
      'INSOMNIA',
    ];

    List<String> releaseDates = [
      'KHOI CHIEU 28.02',
      'KHOI CHIEU 15.03',
      'KHOI CHIEU 07.04',
      'KHOI CHIEU 22.04',
      'KHOI CHIEU 05.05',
      'KHOI CHIEU 19.05',
      'KHOI CHIEU 02.06',
      'KHOI CHIEU 16.06',
      'KHOI CHIEU 30.06',
    ];

    List<String> ratings = [
      '09',
      '08',
      '10',
      '07',
      '08',
      '09',
      '08',
      '09',
      '07',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// POSTER WITH RATING BADGE AND KHOI CHIEU OVERLAY
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/movie_poster.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: const Color(0xFF1E293B),
                    child: const Icon(
                      Icons.movie,
                      color: Colors.white38,
                      size: 32,
                    ),
                  ),
                ),
              ),

              /// RATING BADGE (BOTTOM RIGHT)
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE05A2B),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    ratings[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              /// KHOI CHIEU TEXT OVERLAY (TOP LEFT)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    releaseDates[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        /// MOVIE TITLE
        Text(
          movieTitles[index],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(height: 2),

        /// RELEASE DATE
        Text(
          releaseDates[index],
          style: const TextStyle(color: Colors.white54, fontSize: 9),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

}
