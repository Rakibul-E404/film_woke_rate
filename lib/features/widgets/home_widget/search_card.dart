
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';

class SearchCard extends StatefulWidget {
  final String? title;
  final String? series;
  final String? years;
  final String? duration;
  final String? rating;
  final String? year;
  final String? imagePath;
  final VoidCallback? onTap;

  /// SVG paths for toggle icons
  final String addSvgPath;
  final String removeSvgPath;

  /// Optional size
  final double? topLeftSvgSize;

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
    required this.addSvgPath,
    required this.removeSvgPath,
    this.topLeftSvgSize,
  });

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {

  bool _isAdded = false;

  void _toggleIcon() {
    setState(() {
      _isAdded = !_isAdded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
                  padding: const EdgeInsets.all(0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.asset(
                      widget.imagePath ?? 'assets/images/movie_poster.png',
                      height: 175,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 175,
                        width: double.infinity,
                        color: const Color(0xFF1E293B),
                        child: const Icon(
                          Icons.movie,
                          color: Colors.white38,
                          size: 48,
                        ),
                      ),
                    ),
                  ),
                ),

                /// TOGGLE SVG BUTTON (TOP LEFT)
                Positioned(
                  top: -1,
                  left: 01,
                  child: GestureDetector(
                    onTap: _toggleIcon,
                    child: Center(
                      child: SvgPicture.asset(
                        _isAdded
                            ? widget.removeSvgPath
                            : widget.addSvgPath,
                        width: widget.topLeftSvgSize ?? 35,
                        height: widget.topLeftSvgSize ?? 35,
                      ),
                    ),
                  ),
                ),

                /// RATING BADGE
                if (widget.rating != null)
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
                          widget.rating!,
                          style: AppTextStyle.smallText.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            /// TEXT CONTENT
            if (widget.title != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// TITLE
                    Text(
                      widget.title!,
                      style: AppTextStyle.defaultTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    if (widget.series != null ||
                        widget.years != null ||
                        widget.duration != null) ...[
                      const SizedBox(height: 6),
                      _buildSeriesInfoLine(),
                    ],

                    const SizedBox(height: 10),

                    /// GENRES
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

  /// SERIES INFO LINE
  Widget _buildSeriesInfoLine() {
    const dotStyle = TextStyle(
      color: Color(0xFFB0BEC5),
      fontSize: 13,
      fontWeight: FontWeight.w700,
    );

    List<Widget> children = [];

    if (widget.series != null) {
      children.add(Text(widget.series!, style: AppTextStyle.smallText));
    }

    if (widget.years != null) {
      if (children.isNotEmpty) {
        children.addAll([
          const SizedBox(width: 6),
          const Text('•', style: dotStyle),
          const SizedBox(width: 6),
        ]);
      }
      children.add(Text(widget.years!, style: AppTextStyle.smallText));
    }

    if (widget.duration != null) {
      if (children.isNotEmpty) {
        children.addAll([
          const SizedBox(width: 6),
          const Text('•', style: dotStyle),
          const SizedBox(width: 6),
        ]);
      }
      children.add(Text(widget.duration!, style: AppTextStyle.smallText));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

  /// GENRE CHIP
  Widget _buildGenreChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
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
        ),
      ),
    );
  }

  Color _getRatingColor() {
    if (widget.rating == null) return Colors.grey;

    final double ratingValue = double.tryParse(widget.rating!) ?? 0;

    if (ratingValue >= 8.0) {
      return const Color(0xFFE05A2B);
    } else if (ratingValue >= 6.0) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}