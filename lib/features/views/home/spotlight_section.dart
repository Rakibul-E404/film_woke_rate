import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';
import '../../widgets/home_widget/genre_filter_chips.dart';
import '../../widgets/home_widget/spotlight_card.dart';

class SpotlightSection extends StatefulWidget {
  const SpotlightSection({super.key});

  @override
  State<SpotlightSection> createState() => _SpotlightSectionState();
}

class _SpotlightSectionState extends State<SpotlightSection> {
  String _selectedFilter = 'All';

  final List<Map<String, String>> _spotlightData = [
    {
      'title': 'Stranger Things',
      'series': 'TV Series',
      'years': '2016-2025',
      'duration': '1h',
      'rating': '8.5',
      'year': '2021',
      'imagePath': 'assets/images/movie_poster.png',
    },
    {
      'title': 'Breaking Bad',
      'series': 'TV Series',
      'years': '2008-2013',
      'duration': '45m',
      'rating': '9.5',
      'year': '2008',
      'imagePath': 'assets/images/movie_poster.png',
    },
    {
      'title': 'Dark',
      'series': 'TV Series',
      'years': '2017-2020',
      'duration': '1h',
      'rating': '8.8',
      'year': '2017',
      'imagePath': 'assets/images/movie_poster.png',
    },
    {
      'title': 'The Crown',
      'series': 'TV Series',
      'years': '2016-2023',
      'duration': '1h',
      'rating': '8.6',
      'year': '2016',
      'imagePath': 'assets/images/movie_poster.png',
    },
    {
      'title': 'The Witcher',
      'series': 'TV Series',
      'years': '2019-2023',
      'duration': '1h',
      'rating': '8.2',
      'year': '2019',
      'imagePath': 'assets/images/movie_poster.png',
    },
    {
      'title': 'Wednesday',
      'series': 'TV Series',
      'years': '2022-2024',
      'duration': '50m',
      'rating': '8.1',
      'year': '2022',
      'imagePath': 'assets/images/movie_poster.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Section Title
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
            const SizedBox(width: 20),
            Text(
              "In the spotlight",
              style: AppTextStyle.largeHeadingFranchise,
            ),
            const SizedBox(width: 20),
            SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
          ],
        ),
        const SizedBox(height: 24),

        /// Filter Chips
        GenreFilterChips(
          onFilterSelected: (filter) {
            setState(() {
              _selectedFilter = filter as String;
            });
          },
        ),
        const SizedBox(height: 24),

        /// Grid of Cards
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.6,
          ),
          itemCount: _spotlightData.length,
          itemBuilder: (context, index) {
            final item = _spotlightData[index];
            return SpotlightCard(
              title: item['title']!,
              series: item['series']!,
              years: item['years']!,
              duration: item['duration']!,
              rating: item['rating']!,
              year: item['year']!,
              imagePath: item['imagePath'],
              onTap: () {
                debugPrint('Card ${item['title']} tapped!');
              },
            );
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}