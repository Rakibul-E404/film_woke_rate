import 'package:flutter/material.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';

class MovieCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String type;
  final String year;
  final String duration;
  final double rating;
  final List<String> genres;

  const MovieCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.type,
    required this.year,
    required this.duration,
    required this.rating,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF17384D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🎬 Poster with rating badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  imagePath,
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              /// ⭐ Rating Circle
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFF7B1E14),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFFF6A3D),
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      rating.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 16),

          /// 🎥 Title
          Text(
            title,
            style: AppTextStyle.defaultTextStyle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )
          ),

          const SizedBox(height: 8),

          /// 📺 Info Row
          Text(
            "$type   •   $year   •   $duration",
            style: AppTextStyle.smallText.copyWith(
              fontSize: 14,
              color: AppColors.whiteColor
            ),
          ),

          const SizedBox(height: 14),

          /// 🎭 Genre Chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: genres
                .map(
                  (genre) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColors.whiteColor,
                    width: 1,
                  ),
                ),
                child: Text(
                  genre,
                  style: AppTextStyle.smallText.copyWith(
                    color: AppColors.whiteColor
                  ),
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}