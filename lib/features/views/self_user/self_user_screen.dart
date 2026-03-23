/**
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/custom_background.dart';

// ─────────────────────────────────────────────────────────────────────────────
//  Main Screen
// ─────────────────────────────────────────────────────────────────────────────

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int _selectedIndex    = 3;
  int _selectedTabIndex = 0;

  void _onBottomNavTap(int index) => setState(() => _selectedIndex    = index);
  void _onTabTap(int index)       => setState(() => _selectedTabIndex = index);

  final List<String> tabs = [
    'Repost', 'Ratings', 'Watchlist', 'Favorites', 'Watched',
  ];

  static const double _coverHeight   = 200.0;
  static const double _avatarRadius  = 40.0;
  static const double _avatarOverlap = 24.0;

  // ── helpers ─────────────────────────────────────────────────────────────
  Widget _tabContent() {
    switch (_selectedTabIndex) {
      case 0:  return const RepostTabContent();
      case 1:  return const RatingsTabContent();
      case 2:  return const WatchlistTabContent();
      case 3:  return const FavoritesTabContent();
      case 4:  return const WatchedTabContent();
      default: return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [

                    // ── Cover / AppBar ──────────────────────────────────
                    SliverAppBar(
                      expandedHeight: _coverHeight,
                      pinned: false,
                      floating: false,
                      snap: false,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      automaticallyImplyLeading: false,
                      leading: const SizedBox.shrink(),
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'assets/images/demo_profile_cover.png',
                              fit: BoxFit.cover,
                            ),
                            // top gradient
                            Positioned(
                              top: 0, left: 0, right: 0,
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.45),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // bottom gradient
                            Positioned(
                              bottom: 0, left: 0, right: 0,
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.55),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8, left: 4,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            Positioned(
                              top: 8, right: 4,
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.notifications_outlined, color: Colors.white),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.more_vert, color: Colors.white),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: _avatarRadius * 2 - _avatarOverlap + 8,
                              right: 16,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                                child: const Icon(Icons.camera_alt, size: 14, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(_avatarRadius + _avatarOverlap),
                        child: Transform.translate(
                          offset: Offset(0, _avatarRadius),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: _avatarRadius * 2 + 4,
                                    height: _avatarRadius * 2 + 4,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 3),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          blurRadius: 12,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: CircleAvatar(
                                      radius: _avatarRadius,
                                      backgroundImage: const AssetImage('assets/images/demo_user.jpg'),
                                      backgroundColor: Colors.grey[300],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 2, right: 2,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 1.5),
                                      ),
                                      child: const Icon(Icons.camera_alt, size: 12, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // ── Name + stats ────────────────────────────────────
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(16, _avatarRadius + 12, 16, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tasmiashabu',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '50 Followers · 102 Following',
                              style: TextStyle(fontSize: 14, color: Colors.grey[300]),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ── Sticky Tab bar ──────────────────────────────────
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _TabBarDelegate(
                        tabs: tabs,
                        selectedIndex: _selectedTabIndex,
                        onTabTap: _onTabTap,
                      ),
                    ),

                    // ── Tab content ─────────────────────────────────────
                    SliverToBoxAdapter(child: _tabContent()),

                    const SliverToBoxAdapter(child: SizedBox(height: 100)),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onBottomNavTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.white : Colors.grey, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: isSelected ? Colors.white : Colors.grey),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Tab Bar Delegate
// ─────────────────────────────────────────────────────────────────────────────

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabTap;

  const _TabBarDelegate({
    required this.tabs,
    required this.selectedIndex,
    required this.onTabTap,
  });

  @override double get minExtent => 48;
  @override double get maxExtent => 48;

  @override
  bool shouldRebuild(_TabBarDelegate old) => old.selectedIndex != selectedIndex;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final tabCount            = tabs.length;
        final widthPerTab         = (constraints.maxWidth / tabCount) - 24;
        final dynamicFontSize     = (widthPerTab * 0.7).clamp(10.0, 16.0);

        return Container(
          color: AppColors.primaryColor,
          child: Row(
            children: List.generate(tabs.length, (index) {
              final isActive = selectedIndex == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onTabTap(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
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
                        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
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

// ─────────────────────────────────────────────────────────────────────────────
//  Shared movie data model
// ─────────────────────────────────────────────────────────────────────────────

class _MovieItem {
  final String title;
  final String meta;       // e.g. "Movie • 2018 • 2hr 30min"
  final double rating;
  final String image;

  const _MovieItem({
    required this.title,
    required this.meta,
    required this.rating,
    required this.image,
  });
}

// Sample data shared across tabs
const List<_MovieItem> _demoMovies = [
  _MovieItem(
    title: 'Spider-Man: Across the Spider-Verse',
    meta:  'Movie • 2018 • 2hr 30min',
    rating: 8.5,
    image: 'assets/images/movie_poster2.png',
  ),
  _MovieItem(
    title: 'Spider-Man: Across the Spider-Verse',
    meta:  'Movie • 2018 • 2hr 30min',
    rating: 8.5,
    image: 'assets/images/movie_poster2.png',
  ),
  _MovieItem(
    title: 'Spider-Man: Across the Spider-Verse',
    meta:  'Movie • 2018 • 2hr 30min',
    rating: 8.5,
    image: 'assets/images/movie_poster2.png',
  ),
  _MovieItem(
    title: 'Spider-Man: Across the Spider-Verse',
    meta:  'Movie • 2018 • 2hr 30min',
    rating: 8.5,
    image: 'assets/images/movie_poster2.png',
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
//  Shared list-card widget
// ─────────────────────────────────────────────────────────────────────────────

class _MovieListCard extends StatelessWidget {
  final _MovieItem movie;
  final List<Widget> actions; // buttons shown on the bottom-left

  const _MovieListCard({
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
                    Text(
                      '${movie.rating}  •  ${movie.meta}',
                      style: TextStyle(fontSize: 11, color: Colors.grey[400]),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                if (actions.isNotEmpty)
                  Row(children: actions),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Small circular action button
Widget _circleBtn({
  required IconData icon,
  required Color iconColor,
  required VoidCallback onTap,
})
{
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

// ─────────────────────────────────────────────────────────────────────────────
//  TAB 0 — Repost  (grid, same as original)
// ─────────────────────────────────────────────────────────────────────────────

class RepostTabContent extends StatelessWidget {
  const RepostTabContent({super.key});

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
      itemCount: _demoMovies.length,
      itemBuilder: (context, index) {
        final movie = _demoMovies[index];
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
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        movie.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 8, right: 8,
                      child: const Icon(Icons.close, size: 16, color: Colors.white),
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
                          foregroundImage: AssetImage('assets/images/demo_user.jpg'),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "saved from Tasmia Shabonty's post",
                            style: TextStyle(fontSize: 10, color: Colors.grey[400]),
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

// ─────────────────────────────────────────────────────────────────────────────
//  TAB 1 — Ratings
// ─────────────────────────────────────────────────────────────────────────────

class RatingsTabContent extends StatelessWidget {
  const RatingsTabContent({super.key});

  // Bar chart data: index = rating (1-10), value = count
  static const List<int> _barData = [1, 0, 1, 0, 2, 1, 3, 4, 2, 1];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Stats header ──────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left: total count
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Total Ratings',
                      style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '10',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // Right: bar chart
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Rating Overview',
                      style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                    ),
                    const SizedBox(height: 8),
                    _RatingBarChart(data: _barData),
                  ],
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            'Rated List',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[200],
            ),
          ),
        ),

        // ── Rated list ────────────────────────────────────────────────
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _demoMovies.length,
          itemBuilder: (context, index) {
            final movie = _demoMovies[index];
            return _RatedMovieCard(movie: movie);
          },
        ),
      ],
    );
  }
}

class _RatingBarChart extends StatelessWidget {
  final List<int> data; // 10 values for ratings 1-10

  const _RatingBarChart({required this.data});

  @override
  Widget build(BuildContext context) {
    final maxVal = data.reduce((a, b) => a > b ? a : b).toDouble();
    return SizedBox(
      height: 48,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(data.length, (i) {
          final frac = maxVal > 0 ? data[i] / maxVal : 0.0;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: (frac * 36).clamp(3.0, 36.0),
                    decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${i + 1}',
                    style: TextStyle(fontSize: 7, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _RatedMovieCard extends StatelessWidget {
  final _MovieItem movie;

  const _RatedMovieCard({required this.movie});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Poster with score badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  movie.image,
                  width: 70,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -6,
                left: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red[700],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    movie.rating.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 14),
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
                Text(
                  movie.meta,
                  style: TextStyle(fontSize: 11, color: Colors.grey[400]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  TAB 2 — Watchlist  (× ✓ ♡)
// ─────────────────────────────────────────────────────────────────────────────

class WatchlistTabContent extends StatelessWidget {
  const WatchlistTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 8),
      itemCount: _demoMovies.length,
      itemBuilder: (context, index) {
        final movie = _demoMovies[index];
        return _MovieListCard(
          movie: movie,
          actions: [
            _circleBtn(
              icon: Icons.close,
              iconColor: Colors.redAccent,
              onTap: () {},
            ),
            _circleBtn(
              icon: Icons.check,
              iconColor: Colors.greenAccent,
              onTap: () {},
            ),
            _circleBtn(
              icon: Icons.favorite_border,
              iconColor: Colors.pinkAccent,
              onTap: () {},
            ),
          ],
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  TAB 3 — Favorites  (× only)
// ─────────────────────────────────────────────────────────────────────────────

class FavoritesTabContent extends StatelessWidget {
  const FavoritesTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 8),
      itemCount: _demoMovies.length,
      itemBuilder: (context, index) {
        final movie = _demoMovies[index];
        return _MovieListCard(
          movie: movie,
          actions: [
            _circleBtn(
              icon: Icons.close,
              iconColor: Colors.redAccent,
              onTap: () {},
            ),
          ],
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  TAB 4 — Watched  (× ♡)
// ─────────────────────────────────────────────────────────────────────────────

class WatchedTabContent extends StatelessWidget {
  const WatchedTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 8),
      itemCount: _demoMovies.length,
      itemBuilder: (context, index) {
        final movie = _demoMovies[index];
        return _MovieListCard(
          movie: movie,
          actions: [
            _circleBtn(
              icon: Icons.close,
              iconColor: Colors.redAccent,
              onTap: () {},
            ),
            _circleBtn(
              icon: Icons.favorite_border,
              iconColor: Colors.pinkAccent,
              onTap: () {},
            ),
          ],
        );
      },
    );
  }
}

 */





///
///
///
///
/// todo::  dividing into files
///
///
///
///












// ─────────────────────────────────────────────────────────────────────────────
//  lib/screens/user_profile/user_profile_screen.dart
// ─────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'package:woke_movie_rating/features/views/self_user/tab_bar/self_repost_tab_content.dart';
import 'package:woke_movie_rating/features/views/self_user/tab_bar/self_favorites_tab_content.dart';
import 'package:woke_movie_rating/features/views/self_user/tab_bar/self_ratings_tab_content.dart';
import 'package:woke_movie_rating/features/views/self_user/tab_bar/self_watched_tab_content.dart';
import 'package:woke_movie_rating/features/views/self_user/tab_bar/self_watchlist_tab_content.dart';
import '../../widgets/custom_background.dart';
import '../../widgets/self_user_screen_widget/self_profile_tab_bar.dart';

class SelfUserProfileScreen extends StatefulWidget {
  const SelfUserProfileScreen({super.key});

  @override
  State<SelfUserProfileScreen> createState() => _SelfUserProfileScreenState();
}

class _SelfUserProfileScreenState extends State<SelfUserProfileScreen>
    with SingleTickerProviderStateMixin {

  static const double _coverHeight   = 200.0;
  static const double _avatarRadius  = 40.0;
  static const double _avatarOverlap = 24.0;

  final List<String> _tabs = [
    'Repost', 'Ratings', 'Watchlist', 'Favorites', 'Watched',
  ];

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    // rebuild so ProfileTabBar highlights the right tab on swipe too
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // ── Tab content ──────────────────────────────────────────────────────────
  Widget _tabContent(int index) {
    switch (index) {
      case 0:  return const SelfRepostTabContent();
      case 1:  return const SelfRatingsTabContent();
      case 2:  return const SelfWatchlistTabContent();
      case 3:  return const SelfFavoritesTabContent();
      case 4:  return const SelfWatchedTabContent();
      default: return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomBackground(
        child: SafeArea(
          bottom: false,
          // ── NestedScrollView keeps the outer header scrollable while
          //    the tab bar stays pinned, regardless of which tab is active.
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [

              // ── Cover + Avatar ────────────────────────────────────────
              _buildProfileAppBar(),

              // ── Name + follower stats ─────────────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      16, _avatarRadius + 12, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tasmiashabu',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '50 Followers · 102 Following',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey[300]),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Pinned tab bar ────────────────────────────────────────
              // Wrapped in a SliverPersistentHeader so it sticks to the
              // top of the viewport as soon as the header scrolls away.
              SliverPersistentHeader(
                pinned: true,
                delegate: ProfileTabBar(
                  tabs: _tabs,
                  selectedIndex: _tabController.index,
                  onTabTap: (i) => _tabController.animateTo(i),
                ),
              ),
            ],

            // ── Body: TabBarView so each tab has its own scroll position ─
            body: TabBarView(
              controller: _tabController,
              children: List.generate(
                _tabs.length,
                    (i) => SingleChildScrollView(
                  // Each tab scrolls independently inside the NestedScrollView
                  child: Column(
                    children: [
                      _tabContent(i),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Cover / SliverAppBar ─────────────────────────────────────────────────
  Widget _buildProfileAppBar() {
    return SliverAppBar(
      expandedHeight: _coverHeight,
      pinned: false,
      floating: false,
      snap: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: const SizedBox.shrink(),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/demo_profile_cover.png',
              fit: BoxFit.cover,
            ),
            // Top gradient
            Positioned(
              top: 0, left: 0, right: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.45),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Bottom gradient
            Positioned(
              bottom: 0, left: 0, right: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.55),
                    ],
                  ),
                ),
              ),
            ),
            // Back button
            Positioned(
              top: 8, left: 4,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            // Notification + more
            Positioned(
              top: 8, right: 4,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                        Icons.notifications_outlined, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // Camera icon on cover
            Positioned(
              bottom: _avatarRadius * 2 - _avatarOverlap + 8,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(Icons.camera_alt,
                    size: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(_avatarRadius + _avatarOverlap),
        child: Transform.translate(
          offset: Offset(0, _avatarRadius),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Avatar ring + shadow
                  Container(
                    width: _avatarRadius * 2 + 4,
                    height: _avatarRadius * 2 + 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: _avatarRadius,
                      backgroundImage:
                      const AssetImage('assets/images/demo_user.jpg'),
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                  // Small camera badge
                  Positioned(
                    bottom: 2, right: 2,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                      child: const Icon(Icons.camera_alt,
                          size: 12, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






