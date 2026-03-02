import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';

class GenreFilterChips extends StatefulWidget {
  final Function(List<String>) onFilterSelected; // Changed to List<String>

  const GenreFilterChips({
    super.key,
    required this.onFilterSelected,
  });

  @override
  State<GenreFilterChips> createState() => _GenreFilterChipsState();
}

class _GenreFilterChipsState extends State<GenreFilterChips> {
  String _selectedCategory = 'Trending';
  // Changed from single String? to Set for multiple selection
  final Set<String> _selectedGenres = {};

  final List<String> _categories = ['Trending', 'Popular', 'Recently Added'];
  final List<String> _genres = [
    'Animation',
    'Slice of Life',
    'Fiction',
    'Heros',
    'Comedy',
    'Romance',
    'Action',
    'Drama',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔝 Top Categories (Trending, Popular, Recently Added)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _categories.map((category) {
            final isSelected = _selectedCategory == category;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategory = category;
                    // Optionally clear genres when category changes?
                    // _selectedGenres.clear();
                  });
                  widget.onFilterSelected(_selectedGenres.toList());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _getCategoryIcon(category),
                    const SizedBox(width: 6),
                    Text(
                      category,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Colors.white.withOpacity(0.6),
                        fontSize: 16,
                        fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),

        /// 🔽 Genre Chips (Animation, Slice of Life, etc.) - Multiple selection enabled
        SizedBox(
          height: 44,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _genres.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final genre = _genres[index];
              final isSelected = _selectedGenres.contains(genre);
              return _buildGenreChip(genre, isSelected);
            },
          ),
        ),
      ],
    );
  }

  Widget _getCategoryIcon(String category) {
    switch (category) {
      case 'Trending':
        return SvgPicture.asset(
          "assets/icons/trending.svg",
          height: 18,
          width: 18,
        );
      case 'Popular':
        return SvgPicture.asset(
          "assets/icons/popular.svg",
          height: 18,
          width: 18,
        );
      case 'Recently Added':
        return SvgPicture.asset(
          "assets/icons/add.svg",
          height: 18,
          width: 18,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildGenreChip(String genre, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedGenres.remove(genre); // Deselect if already selected
          } else {
            _selectedGenres.add(genre); // Select if not selected
          }
        });
        // Pass the list of selected genres to parent
        widget.onFilterSelected(_selectedGenres.toList());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.redColor  // Selected: 20% white
              : AppColors.whiteColor.withValues(alpha: 0.5),  // Unselected: 10% white
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Text(
          genre,
          style: AppTextStyle.defaultTextStyle
        ),
      ),
    );
  }
}