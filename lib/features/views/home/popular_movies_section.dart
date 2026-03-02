import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';
import '../../widgets/home_widget/movie_card.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ⭐ Title
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
            const SizedBox(width: 20),
            Text("Popular", style: AppTextStyle.largeHeadingFranchise),
            const SizedBox(width: 20),
            SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
          ],
        ),
        const SizedBox(height: 16),

        /// 🎥 Horizontal Movie List
        SizedBox(
          height: 430,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 5,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return MovieCard(
                imagePath: "assets/images/movie_poster.png",
                title: "Stranger Things",
                type: "TV Series",
                year: "2016-2025",
                duration: "1h",
                rating: 8.5,
                genres: const ["Kdrama", "Thriller", "Fantasy"],
              );
            },
          ),
        ),
      ],
    );
  }
}