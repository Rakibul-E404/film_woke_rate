import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woke_movie_rating/features/models/movie_model.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';

import 'action_button.dart';

class MovieDetailsHeader extends StatelessWidget {
  final MovieModel movieData;
  final VoidCallback onBackPressed;
  final VoidCallback onWatchTrailerPressed;
  final VoidCallback onCheckmarkPressed;
  final VoidCallback onFavoritePressed;
  final VoidCallback onBookmarkPressed;

  const MovieDetailsHeader({
    super.key,
    required this.movieData,
    required this.onBackPressed,
    required this.onWatchTrailerPressed,
    required this.onCheckmarkPressed,
    required this.onFavoritePressed,
    required this.onBookmarkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320,
      floating: false,
      pinned: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 8),
        child: GestureDetector(
          onTap: onBackPressed,
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
                            errorBuilder: (context, error, stackTrace) =>
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// TITLE
                              Row(
                                children: [
                                  Text(
                                    movieData.title,
                                    style: AppTextStyle.largeHeadingFranchise
                                        .copyWith(fontSize: 40),
                                  ),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(
                                    "assets/icons/woke_alert.svg",
                                    height: 40,
                                    width: 40,
                                    placeholderBuilder: (context) => Container(
                                      height: 40,
                                      width: 40,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              /// SUBTITLE
                              Text(
                                movieData.subtitle,
                                style: const TextStyle(
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
                                        color: Colors.white.withOpacity(0.3),
                                        width: 2,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        movieData.averageRating
                                            .toStringAsFixed(1),
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
                                      onPressed: onWatchTrailerPressed,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        AppColors.mainBottomNavColor,
                                        foregroundColor: AppColors.whiteColor,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 12,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(25),
                                          side: BorderSide(
                                            color: AppColors.borderColor,
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
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              /// ACTION BUTTONS
                              Row(
                                children: [
                                  ActionButton(
                                    icon: CupertinoIcons.checkmark_alt,
                                    onTap: onCheckmarkPressed,
                                  ),
                                  const SizedBox(width: 10),
                                  ActionButton(
                                    icon: Icons.favorite_border,
                                    onTap: onFavoritePressed,
                                  ),
                                  const SizedBox(width: 10),
                                  ActionButton(
                                    icon: Icons.bookmark_add_outlined,
                                    onTap: onBookmarkPressed,
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
    );
  }
}