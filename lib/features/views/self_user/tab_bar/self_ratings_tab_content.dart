// ─────────────────────────────────────────────────────────────────────────────
//  lib/screens/user_profile/tabs/ratings_tab.dart
// ─────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';

import '../../../../models/movie_item.dart';
// import '../../../models/movie_item.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/self_user_screen_widget/self_rating_bar_chart.dart';
// import '../widgets/self_rating_bar_chart.dart';

class SelfRatingsTabContent extends StatelessWidget {
  const SelfRatingsTabContent({super.key});

  static const List<int> _barData = [1, 0, 1, 0, 2, 1, 3, 4, 2, 1];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Stats header ──────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 56, 16, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left: total count
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Total Ratings',
                      style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '10',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // Right: bar chart
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Rating Overview',
                      style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                    ),
                    const SizedBox(height: 8),
                    const RatingBarChart(data: _barData),
                  ],
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            'Rated List',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[200],
            ),
          ),
        ),

        // ── Rated movie list ──────────────────────────────────────────
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: demoMovies.length,
          itemBuilder: (context, index) =>
              _RatedMovieCard(movie: demoMovies[index]),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Rated movie card  (poster with score badge)
// ─────────────────────────────────────────────────────────────────────────────

class _RatedMovieCard extends StatelessWidget {
  final MovieItem movie;

  const _RatedMovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Poster with score badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  movie.image,
                  width: 70,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -6,
                left: 4,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red[700],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    movie.rating.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  movie.meta,
                  style: TextStyle(fontSize: 11, color: Colors.grey[400]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}