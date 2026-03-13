import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/custom_background.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int _selectedIndex = 3;
  int _selectedTabIndex = 0;

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTabTap(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  final List<String> tabs = [
    'Repost',
    'Ratings',
    'Watchlist',
    'Favorites',
    'Watched',
  ];

  // Height of the cover/banner image in the SliverAppBar
  static const double _coverHeight = 200.0;
  // How much the avatar overlaps into the cover image from the bottom
  static const double _avatarRadius = 40.0;
  static const double _avatarOverlap = 24.0; // px that go INTO the cover

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // ── Scrollable area ──────────────────────────────────────────
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    // ── SliverAppBar (cover image) — NOT pinned, scrolls away fully ──
                    SliverAppBar(
                      expandedHeight: _coverHeight,
                      pinned: false,
                      floating: false,
                      snap: false,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      automaticallyImplyLeading: false,

                      // No leading/actions — they live inside the cover Stack below
                      leading: const SizedBox.shrink(),

                      // The large cover / banner image
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Cover image
                            Image.asset(
                              'assets/images/demo_profile_cover.png',
                              fit: BoxFit.cover,
                            ),
                            // Subtle dark gradient — top (for button legibility)
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
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
                            // Subtle dark gradient — bottom (avatar transition)
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
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
                            // Back button — top left
                            Positioned(
                              top: 8,
                              left: 4,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back,
                                    color: Colors.white),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            // Notification + more — top right
                            Positioned(
                              top: 8,
                              right: 4,
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                        Icons.notifications_outlined,
                                        color: Colors.white),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.more_vert,
                                        color: Colors.white),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                            // Camera icon (bottom-right of cover)
                            Positioned(
                              bottom: _avatarRadius * 2 -
                                  _avatarOverlap +
                                  8,
                              right: 16,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 2),
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ── Floating avatar that overlaps the bottom of the
                      //    cover image ─────────────────────────────────────
                      bottom: PreferredSize(
                        preferredSize:
                        Size.fromHeight(_avatarRadius + _avatarOverlap),
                        child: Transform.translate(
                          // Shift the avatar upward so it "bites into" the
                          // cover by _avatarOverlap pixels
                          offset: Offset(0, _avatarRadius),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  // White ring / border effect
                                  Container(
                                    width: _avatarRadius * 2 + 4,
                                    height: _avatarRadius * 2 + 4,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                          Colors.black.withOpacity(0.4),
                                          blurRadius: 12,
                                          spreadRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: CircleAvatar(
                                      radius: _avatarRadius,
                                      backgroundImage: const AssetImage(
                                          'assets/images/demo_user.jpg'),
                                      backgroundColor: Colors.grey[300],
                                    ),
                                  ),
                                  // Small camera badge on avatar
                                  Positioned(
                                    bottom: 2,
                                    right: 2,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.white, width: 1.5),
                                      ),
                                      child: const Icon(
                                        Icons.camera_alt,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // ── Profile name + stats (below the avatar) ───────────
                    SliverToBoxAdapter(
                      child: Padding(
                        // Top padding = how much avatar hangs below the bar
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
                                fontSize: 14,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ── Sticky Tab bar ────────────────────────────────────
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _TabBarDelegate(
                        tabs: tabs,
                        selectedIndex: _selectedTabIndex,
                        onTabTap: _onTabTap,
                      ),
                    ),

                    // ── Content Grid ──────────────────────────────────────
                    SliverPadding(
                      padding: const EdgeInsets.all(8),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) => _buildGridItem(),
                          childCount: 6,
                        ),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                      ),
                    ),

                    // Bottom padding so last items clear the nav bar
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 16),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.primaryColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    'assets/images/movie_poster2.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: const Icon(
                    Icons.close,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                      radius: 15,
                     foregroundImage: AssetImage("assets/images/demo_user.jpg"),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        "saved from Tasmia Shabonty's post",
                        style:
                        TextStyle(fontSize: 10, color: Colors.grey[400]),
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
  }

  Widget _buildBottomNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onBottomNavTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: isSelected ? Colors.white : Colors.grey, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Sticky Tab Bar Delegate ───────────────────────────────────────────────────


class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabTap;

  const _TabBarDelegate({
    required this.tabs,
    required this.selectedIndex,
    required this.onTabTap,
  });

  @override
  double get minExtent => 48;
  @override
  double get maxExtent => 48;

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) =>
      oldDelegate.selectedIndex != selectedIndex;


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final tabCount = tabs.length;
        final availableWidthPerTab = (availableWidth / tabCount) - 24;
        final dynamicFontSize = (availableWidthPerTab * 0.7).clamp(10.0, 16.0);

        return Container(
          color: AppColors.primaryColor,
          child: Row(
            children: List.generate(
              tabs.length,
                  (index) {
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
              },
            ),
          ),
        );
      },
    );
  }


}