// ─────────────────────────────────────────────────────────────────────────────
//  lib/screens/user_profile/widgets/self_profile_tab_bar.dart
// ─────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';

// import '../../../utils/app_colors.dart';
import '../../utils/app_colors.dart';

class ProfileTabBar extends SliverPersistentHeaderDelegate {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabTap;

  const ProfileTabBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onTabTap,
  });

  @override
  double get minExtent => 48;

  @override
  double get maxExtent => 48;

  @override
  bool shouldRebuild(ProfileTabBar old) => old.selectedIndex != selectedIndex;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final widthPerTab     = (constraints.maxWidth / tabs.length) - 24;
        final dynamicFontSize = (widthPerTab * 0.7).clamp(10.0, 16.0);

        return Container(
          color: AppColors.primaryColor,
          child: Row(
            children: List.generate(tabs.length, (index) {
              final isActive = selectedIndex == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onTabTap(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isActive ? Colors.red : AppColors.greyColor,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Text(
                      tabs[index],
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: dynamicFontSize,
                        fontWeight:
                        isActive ? FontWeight.bold : FontWeight.normal,
                        color: isActive ? Colors.white : Colors.grey[400],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}