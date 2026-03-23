// ─────────────────────────────────────────────────────────────────────────────
//  lib/screens/user_profile/tabs/repost_tab.dart
// ─────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';

import '../../../../models/movie_item.dart';
// import '../../../models/movie_item.dart';
import '../../../utils/app_colors.dart';

class SelfRepostTabContent extends StatelessWidget {
  const SelfRepostTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: demoMovies.length,
      itemBuilder: (context, index) {
        final movie = demoMovies[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12)),
                      child: Image.asset(
                        movie.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(Icons.close, size: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'When Mel Brooks was preparing for this film, he discovered that Ken Strickfaden preparing for...',
                      style: TextStyle(fontSize: 12, color: Colors.grey[300]),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 10,
                          foregroundImage:
                          AssetImage('assets/images/demo_user.jpg'),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "saved from Tasmia Shabonty's post",
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey[400]),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}