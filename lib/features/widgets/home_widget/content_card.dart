import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContentCard extends StatelessWidget {
  final String number;
  final String title;
  final String series;
  final String rating;
  final String year;
  final String? imagePath;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const ContentCard({
    Key? key,
    required this.number,
    required this.title,
    required this.series,
    required this.rating,
    required this.year,
    this.imagePath,
    this.onTap,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 240,
        height: height ?? 160,
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            /// 🔷 LEFT: IMAGE SECTION (fixed width)
            Container(
              width: 100,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    imagePath ?? 'assets/images/movie_poster.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// 🔷 RIGHT: TEXT CONTENT (expanded)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Top section (number and title)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Number (01)
                        Text(
                          number,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),

                        /// Title
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                    /// Middle section (series info)
                    Text(
                      series,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                        height: 1.3,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    /// Bottom section (rating and year)
                    Row(
                      children: [
                        /// ✅ FIXED: Rating SVG with proper properties
                        SvgPicture.asset(
                          "assets/icons/rate_fill.svg",
                          height: 25, // REQUIRED: Specify size
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 6),

                        /// Dot separator
                        Text(
                          '•',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.5),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 6),

                        /// Year
                        Text(
                          year,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 14,
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