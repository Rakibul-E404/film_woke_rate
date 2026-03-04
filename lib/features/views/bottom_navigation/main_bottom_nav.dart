import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';
import 'package:woke_movie_rating/features/views/home/home_screen.dart';

import '../../utils/app_colors.dart';
import '../community/community_screen.dart';
import '../leaderboard/leaderboard_screen.dart';
import '../user/user_screen.dart';

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // ✅ Make the system navigation bar fully transparent
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
    ));

    // ✅ Required on Android to actually render behind the system nav bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const LeaderboardScreen(),
    const CommunityScreen(),
    const UserProfileScreen(),
  ];

  final List<Map<String, dynamic>> _navItems = [
    {
      'icon': 'assets/icons/home.svg',
      'activeIcon': 'assets/icons/home_fill.svg',
      'label': 'Home',
    },
    {
      'icon': 'assets/icons/leaderboard_Light.svg',
      'activeIcon': 'assets/icons/leaderboard_Light_fill.svg',
      'label': 'Leaderboard',
    },
    {
      'icon': 'assets/icons/community_light.svg',
      'activeIcon': 'assets/icons/community_light_fill.svg',
      'label': 'Community',
    },
    {
      'icon': 'assets/icons/User_alt_light.svg',
      'activeIcon': 'assets/icons/User_alt_light_fill.svg',
      'label': 'UserProfile',
    },
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      _animationController.forward(from: 0.0);
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final outerPadding = 13.0 * 2;
    final innerPadding = 8.0 * 2;
    final totalPadding = outerPadding + innerPadding;
    final availableWidth = screenWidth - totalPadding;
    final itemWidth = availableWidth / _navItems.length;
    final itemMargin = 2.0;

    return Scaffold(
      // ✅ Transparent so screen background shows through the gap areas
      backgroundColor: Colors.transparent,
      // ✅ Allows the body content to render behind the bottom nav bar
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(14, 2, 14, 8),
        child: Container(
          height: 85.0,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.mainBottomNavColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // ✅ Red selection indicator
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: (_selectedIndex * itemWidth),
                top: 10,
                bottom: 10,
                width: itemWidth - (itemMargin * 2),
                child: Container(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              // ✅ Nav items
              Row(
                children: List.generate(_navItems.length, (index) {
                  final item = _navItems[index];
                  final isSelected = _selectedIndex == index;

                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: itemMargin),
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: GestureDetector(
                          onTap: () => _onItemTapped(index),
                          behavior: HitTestBehavior.opaque,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedScale(
                                scale: isSelected ? 1.1 : 1.0,
                                duration: const Duration(milliseconds: 200),
                                child: SvgPicture.asset(
                                  isSelected ? item['activeIcon'] : item['icon'],
                                  width: 18,
                                  height: 18,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.whiteColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item['label'],
                                style: AppTextStyle.smallText.copyWith(
                                  color: AppColors.whiteColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}