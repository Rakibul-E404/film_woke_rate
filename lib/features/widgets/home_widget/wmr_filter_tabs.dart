import 'package:flutter/material.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';

class WmrFilterTabs extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterSelected;
  final List<String> filters;
  final double fontSize;
  final Color indicatorColor;
  final double indicatorHeight;
  final double spacing;

  const WmrFilterTabs({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
    this.filters = const ['Today', 'Week', 'Month'],
    this.fontSize = 24,
    this.indicatorColor = Colors.white,
    this.indicatorHeight = 2,
    this.spacing = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < filters.length; i++) ...[
          GestureDetector(
            onTap: () => onFilterSelected(filters[i]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ✅ FIX: Use fixed width container to prevent text movement
                SizedBox(
                  width: 60, // Adjust based on your longest text
                  child: Text(
                    filters[i],
                    style: AppTextStyle.defaultTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: indicatorHeight,
                  width: selectedFilter == filters[i] ? 60 : 0,
                  decoration: BoxDecoration(
                    color: selectedFilter == filters[i]
                        ? indicatorColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
          if (i < filters.length - 1) SizedBox(width: spacing),
        ],
      ],
    );
  }
}