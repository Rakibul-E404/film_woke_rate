// ─────────────────────────────────────────────────────────────────────────────
//  lib/screens/user_profile/widgets/self_movie_list_card.dart
// ─────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';

import '../../../models/movie_item.dart';
import '../../utils/app_colors.dart';

class MovieListCard extends StatelessWidget {
  final MovieItem movie;
  final List<Widget> actions;

  const MovieListCard({
    super.key,
    required this.movie,
    required this.actions,
  });

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              movie.image,
              width: 70,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // Info + actions
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
                Row(
                  children: [
                    const Icon(Icons.pets, size: 13, color: Colors.orange),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '${movie.rating}  •  ${movie.meta}',
                        style: TextStyle(fontSize: 11, color: Colors.grey[400]),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                if (actions.isNotEmpty) Row(children: actions),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Small circular action button  (shared helper)
// ─────────────────────────────────────────────────────────────────────────────

Widget circleBtn({
  required IconData icon,
  required Color iconColor,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.08),
        border: Border.all(color: Colors.white24, width: 1),
      ),
      child: Icon(icon, size: 15, color: iconColor),
    ),
  );
}