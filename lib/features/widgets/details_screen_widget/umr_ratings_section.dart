import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';
import 'package:woke_movie_rating/features/widgets/details_screen_widget/rating_bar_widget.dart';

class UmrRatingsSection extends StatelessWidget {
  final double averageRating;
  final int totalRatings;
  final List<int> ratingDistribution;
  final int? userRating;
  final VoidCallback onAddRatingTap;

  const UmrRatingsSection({
    super.key,
    required this.averageRating,
    required this.totalRatings,
    required this.ratingDistribution,
    required this.userRating,
    required this.onAddRatingTap,
  });

  @override
  Widget build(BuildContext context) {
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
              onTap: onAddRatingTap,
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
                      userRating != null ? 'Update Rating' : 'Add Your Rating',
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
        if (userRating != null)
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
                    'Your Rating: $userRating/10',
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
                      averageRating.toInt() < 10
                          ? '0${averageRating.toInt()}'
                          : averageRating.toInt().toString(),
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
                      color: index < (averageRating / 2).floor()
                          ? const Color(0xFFE05A2B)
                          : Colors.white24,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'By ${totalRatings >= 1000 ? '${(totalRatings / 1000).toStringAsFixed(1)}k' : totalRatings} users',
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
                  int barWidth = ratingDistribution[ratingValue - 1];
                  double maxWidth = ratingDistribution
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
}