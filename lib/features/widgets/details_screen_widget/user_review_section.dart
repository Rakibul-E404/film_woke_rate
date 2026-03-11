import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woke_movie_rating/features/models/movie_model.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';
import 'package:woke_movie_rating/features/widgets/details_screen_widget/review_card.dart';

class UserReviewSection extends StatelessWidget {
  final List<Review> reviews;
  final VoidCallback onAddReviewTap;
  final VoidCallback onLoadMoreTap;

  const UserReviewSection({
    super.key,
    required this.reviews,
    required this.onAddReviewTap,
    required this.onLoadMoreTap,
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
            Text('USER REVIEW', style: AppTextStyle.largeHeadingFranchise),
          ],
        ),
        const SizedBox(height: 20),
        /// ADD REVIEW SECTION
        GestureDetector(
          onTap: onAddReviewTap,
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/demo_user.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Your Review',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(height: 1, color: Colors.white.withOpacity(0.3)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        /// REVIEW LIST
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            final review = reviews[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: ReviewCard(
                name: review.name,
                imagePath: review.imagePath,
                date: review.date,
                reviewText: review.reviewText,
              ),
            );
          },
        ),
        /// LOAD MORE BUTTON
        Center(
          child: GestureDetector(
            onTap: onLoadMoreTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: const Text(
                'Load More',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}