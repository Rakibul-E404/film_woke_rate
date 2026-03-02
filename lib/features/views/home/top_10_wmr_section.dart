import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';
import '../../widgets/home_widget/content_card.dart';
import '../../widgets/home_widget/wmr_filter_tabs.dart';

class Top10WmrSection extends StatefulWidget {
  const Top10WmrSection({super.key});

  @override
  State<Top10WmrSection> createState() => _Top10WmrSectionState();
}

class _Top10WmrSectionState extends State<Top10WmrSection> {
  String _selectedFilter = 'Today';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// ⭐ Title
        _buildSectionTitle("TOP 10 WMR LIST"),
        const SizedBox(height: 20),

        /// 🎯 Filter Tabs
        WmrFilterTabs(
          selectedFilter: _selectedFilter,
          onFilterSelected: (newFilter) {
            setState(() => _selectedFilter = newFilter);
          },
          indicatorColor: Colors.white.withValues(alpha: 0.3),
          indicatorHeight: 2,
          spacing: 30,
        ),
        const SizedBox(height: 20),

        /// 🎥 Horizontal Content Cards
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                width: 300,
                margin: EdgeInsets.only(left: index == 0 ? 0 : 12),
                child: ContentCard(
                  number: '${index + 1}'.padLeft(2, '0'),
                  title: 'The Strangers',
                  series: 'Things : Season 1',
                  rating: '8.5',
                  year: '2021',
                  imagePath: 'assets/images/movie_poster.png',
                  onTap: () => print('Card ${index + 1} tapped!'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
        const SizedBox(width: 20),
        Text(title, style: AppTextStyle.largeHeadingFranchise),
        const SizedBox(width: 20),
        SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
      ],
    );
  }
}