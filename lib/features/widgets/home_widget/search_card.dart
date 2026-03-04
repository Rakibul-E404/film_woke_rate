import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';

class SearchCard extends StatelessWidget {
  final String? title;
  final String? series;      // e.g. 'TV Series'
  final String? years;       // e.g. '2016-2025'
  final String? duration;    // e.g. '1h'
  final String? rating;
  final String? year;
  final String? imagePath;
  final VoidCallback? onTap;

  /// New optional parameters for top left corner
  final String? topLeftSvgPath;  // SVG path for top left corner
  final Widget? topLeftWidget;    // Custom widget for top left corner
  final double? topLeftSvgSize;   // Size of SVG (default: 24)

  const SearchCard({
    super.key,
    this.title,
    this.series,
    this.years,
    this.duration,
    this.rating,
    this.year,
    this.imagePath,
    this.onTap,
    this.topLeftSvgPath,
    this.topLeftWidget,
    this.topLeftSvgSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
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
                    borderRadius: BorderRadius.circular(14),
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

                /// TOP LEFT CORNER SVG/CUSTOM WIDGET
                if (topLeftSvgPath != null || topLeftWidget != null)
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: topLeftWidget ??
                            (topLeftSvgPath != null
                                ? SvgPicture.asset(
                              topLeftSvgPath!,
                              width: topLeftSvgSize ?? 24,
                              height: topLeftSvgSize ?? 24,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            )
                                : null),
                      ),
                    ),
                  ),

                /// CIRCULAR RATING BADGE (only if rating is provided)
                if (rating != null)
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
                          rating!,
                          style: AppTextStyle.smallText.copyWith(
                              color: AppColors.whiteColor
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            /// TEXT CONTENT (only if title exists)
            if (title != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Text(
                      title!,
                      style: AppTextStyle.defaultTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    /// Series Info Line (only if at least one of series, years, duration exists)
                    if (series != null || years != null || duration != null) ...[
                      const SizedBox(height: 6),
                      _buildSeriesInfoLine(),
                    ],

                    /// Genre chips (always shown for now, but you can make optional too)
                    const SizedBox(height: 10),
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

  /// Renders: TV Series • 2016-2025 • 1h (only shows available items)
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

    List<Widget> children = [];

    // Add series if available
    if (series != null) {
      children.add(Text(series!, style: AppTextStyle.smallText));
    }

    // Add years if available
    if (years != null) {
      if (children.isNotEmpty) {
        children.addAll([
          const SizedBox(width: 6),
          const Text('•', style: dotStyle),
          const SizedBox(width: 6),
        ]);
      }
      children.add(Text(years!, style: AppTextStyle.smallText));
    }

    // Add duration if available
    if (duration != null) {
      if (children.isNotEmpty) {
        children.addAll([
          const SizedBox(width: 6),
          const Text('•', style: dotStyle),
          const SizedBox(width: 6),
        ]);
      }
      children.add(Text(duration!, style: AppTextStyle.smallText));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children.isNotEmpty ? children : [const SizedBox.shrink()],
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
    if (rating == null) return Colors.grey;
    final double ratingValue = double.tryParse(rating!) ?? 0;
    if (ratingValue >= 8.0) {
      return const Color(0xFFE05A2B);
    } else if (ratingValue >= 6.0) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}