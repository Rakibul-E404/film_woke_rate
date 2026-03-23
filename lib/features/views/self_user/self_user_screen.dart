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






