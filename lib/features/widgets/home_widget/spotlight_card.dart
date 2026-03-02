
import 'package:flutter/material.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';

class SpotlightCard extends StatelessWidget {
  final String title;
  final String series;      // e.g. 'TV Series'
  final String years;       // e.g. '2016-2025'
  final String duration;    // e.g. '1h'
  final String rating;
  final String year;
  final String? imagePath;
  final VoidCallback? onTap;

  const SpotlightCard({
    super.key,
    required this.title,
    required this.series,
    required this.years,
    required this.duration,
    required this.rating,
    required this.year,
    this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:  AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
          

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE SECTION
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius:  BorderRadius.circular(14),
                    child: Image.asset(
                      imagePath ?? 'assets/images/movie_poster.png',
                      height: 175,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 175,
                        width: double.infinity,
                        color: const Color(0xFF1E293B),
                        child: const Icon(Icons.movie,
                            color: Colors.white38, size: 48),
                      ),
                    ),
                  ),
                ),

                /// CIRCULAR RATING BADGE
                Positioned(
                  bottom: 14,
                  right: 12,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF5C1A0A),
                      border: Border.all(
                        color: _getRatingColor(),
                        width: 2.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: _getRatingColor().withOpacity(0.4),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        rating,
                        style: AppTextStyle.smallText.copyWith(
                          color: AppColors.whiteColor
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// TEXT CONTENT
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    title,
                    style: AppTextStyle.defaultTextStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),

                  /// ── Series Info Line: TV Series  •  2016-2025  •  1h ──
                  _buildSeriesInfoLine(),

                  const SizedBox(height: 10),

                  /// GENRE CHIPS
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        _buildGenreChip('Kdrama'),
                        const SizedBox(width: 6),
                        _buildGenreChip('Thriller'),
                        const SizedBox(width: 6),
                        _buildGenreChip('Fantasy'),
                        const SizedBox(width: 6),
                        _buildGenreChip('Action'),
                        const SizedBox(width: 6),
                        _buildGenreChip('Drama'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Renders:  TV Series  •  2016-2025  •  1h
  Widget _buildSeriesInfoLine() {
    const textStyle = TextStyle(
      color: Color(0xFFB0BEC5),
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.1,
    );

    const dotStyle = TextStyle(
      color: Color(0xFFB0BEC5),
      fontSize: 13,
      fontWeight: FontWeight.w700,
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(series, style: AppTextStyle.smallText),
          const SizedBox(width: 6),
          const Text('•', style: dotStyle),
          const SizedBox(width: 6),
          Text(years, style: AppTextStyle.smallText),
          const SizedBox(width: 6),
          const Text('•', style: dotStyle),
          const SizedBox(width: 6),
          Text(duration, style: AppTextStyle.smallText),
        ],
      ),
    );
  }

  Widget _buildGenreChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.45),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white.withOpacity(0.85),
          fontSize: 10.5,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Color _getRatingColor() {
    final double ratingValue = double.tryParse(rating) ?? 0;
    if (ratingValue >= 8.0) {
      return const Color(0xFFE05A2B);
    } else if (ratingValue >= 6.0) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}