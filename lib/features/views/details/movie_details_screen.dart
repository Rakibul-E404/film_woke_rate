import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:woke_movie_rating/features/models/movie_model.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/widgets/custom_background.dart';
import 'package:woke_movie_rating/features/widgets/details_screen_widget/movie_details_header.dart';
import 'package:woke_movie_rating/features/widgets/details_screen_widget/overview_section.dart';
import 'package:woke_movie_rating/features/widgets/details_screen_widget/cast_section.dart';
import 'package:woke_movie_rating/features/widgets/details_screen_widget/all_seasons_section.dart';
import 'package:woke_movie_rating/features/widgets/details_screen_widget/umr_ratings_section.dart';
import 'package:woke_movie_rating/features/widgets/details_screen_widget/user_review_section.dart';
import 'package:woke_movie_rating/features/widgets/details_screen_widget/recommendations_section.dart';
import 'package:woke_movie_rating/features/widgets/details_screen_widget/rating_bar_widget.dart';

import '../../widgets/details_screen_widget/stars_divider.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  int? _userRating;
  late MovieModel _movieData;

  @override
  void initState() {
    super.initState();
    _initializeMovieData();
  }

  void _initializeMovieData() {
    _movieData = MovieModel(
      title: 'THE OFFICE',
      subtitle: 'TV Series • S1-S9 • 22m',
      averageRating: 8.5,
      totalRatings: 1900,
      ratingDistribution: [45, 38, 42, 58, 85, 120, 210, 320, 450, 532],
      overview:
      'A mockumentary on a group of typical office workers, where the workday consists of ego clashes, inappropriate behavior, tedium and romance. A mockumentary on a group of typical office workers, where the workday consists of ego clashes, inappropriate behavior, tedium and romance.',
      cast: List.generate(
        6,
            (index) => CastMember(
          name: 'Rainn Wilson',
          character: 'Dwight Schrute',
        ),
      ),
      seasons: List.generate(
        5,
            (index) => Season(
          seasonNumber: index + 1,
          year: '${2005 + index}',
          episodeCount: 6,
          rating: 8.5,
        ),
      ),
      reviews: List.generate(
        3,
            (index) => Review(
          name: 'Farhan Hasan',
          imagePath: 'assets/images/demo_user.jpg',
          date: '23 Nov, 2025',
          reviewText:
          'Such an incredible show. Probably my favorite show of all time. The characters and office environment is easy to relate to. The humor is timeless and the character development throughout the seasons is amazing.',
        ),
      ),
      recommendations: [
        Recommendation(
          title: 'INTERSTELLAR',
          releaseDate: 'KHOI CHIEU 28.02',
          rating: '09',
        ),
        Recommendation(
          title: 'INCEPTION',
          releaseDate: 'KHOI CHIEU 15.03',
          rating: '08',
        ),
        Recommendation(
          title: 'THE DARK KNIGHT',
          releaseDate: 'KHOI CHIEU 07.04',
          rating: '10',
        ),
        Recommendation(
          title: 'TENET',
          releaseDate: 'KHOI CHIEU 22.04',
          rating: '07',
        ),
        Recommendation(
          title: 'DUNKIRK',
          releaseDate: 'KHOI CHIEU 05.05',
          rating: '08',
        ),
        Recommendation(
          title: 'OPPENHEIMER',
          releaseDate: 'KHOI CHIEU 19.05',
          rating: '09',
        ),
        Recommendation(
          title: 'MEMENTO',
          releaseDate: 'KHOI CHIEU 02.06',
          rating: '08',
        ),
        Recommendation(
          title: 'PRESTIGE',
          releaseDate: 'KHOI CHIEU 16.06',
          rating: '09',
        ),
        Recommendation(
          title: 'INSOMNIA',
          releaseDate: 'KHOI CHIEU 30.06',
          rating: '07',
        ),
      ],
    );
  }

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
          child: const Padding(
            padding: EdgeInsets.all(24.0),
            child: MovieRatingWidget(),
          ),
        );
      },
    ).then((selectedRating) {
      if (selectedRating != null) {
        setState(() {
          _userRating = selectedRating;

          // Update movie data
          _movieData.totalRatings += 1;
          _movieData.averageRating =
          ((_movieData.averageRating * (_movieData.totalRatings - 1) +
              selectedRating) /
              _movieData.totalRatings);
        });

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
            /// HEADER SECTION - Now using the new MovieDetailsHeader widget
            MovieDetailsHeader(
              movieData: _movieData,
              onBackPressed: () => Navigator.pop(context),
              onWatchTrailerPressed: () {
                HapticFeedback.lightImpact();
                print('Watch Trailer tapped');
              },
              onCheckmarkPressed: () {
                HapticFeedback.lightImpact();
                print('Checkmark tapped');
              },
              onFavoritePressed: () {
                HapticFeedback.lightImpact();
                print('Favorite tapped');
              },
              onBookmarkPressed: () {
                HapticFeedback.lightImpact();
                print('Bookmark tapped');
              },
            ),

            /// CONTENT SLIVER
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const StarsDivider(),
                  const SizedBox(height: 28),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        OverviewSection(overview: _movieData.overview),
                        const SizedBox(height: 28),
                        CastSection(cast: _movieData.cast),
                        const SizedBox(height: 28),
                        AllSeasonsSection(seasons: _movieData.seasons),
                        const SizedBox(height: 28),
                        UmrRatingsSection(
                          averageRating: _movieData.averageRating,
                          totalRatings: _movieData.totalRatings,
                          ratingDistribution: _movieData.ratingDistribution,
                          userRating: _userRating,
                          onAddRatingTap: () => _showRatingDialog(context),
                        ),
                        const SizedBox(height: 28),
                        UserReviewSection(
                          reviews: _movieData.reviews,
                          onAddReviewTap: () {
                            HapticFeedback.lightImpact();
                            print('Add review tapped');
                          },
                          onLoadMoreTap: () {
                            HapticFeedback.lightImpact();
                            print('Load more reviews');
                          },
                        ),
                        const SizedBox(height: 28),
                        RecommendationsSection(
                          recommendations: _movieData.recommendations,
                        ),
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
}



