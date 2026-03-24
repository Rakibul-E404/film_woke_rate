/**
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';

import '../../widgets/home_widget/dropdown_arrow.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> {
  final GlobalKey _avatarKey = GlobalKey();

  void _showProfileDropdown(BuildContext context) {
    final RenderBox renderBox =
    _avatarKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      builder: (context) {
        return Stack(
          children: [
            // Tap outside to dismiss
            GestureDetector(
              onTap: () => Get.back(),
              // behavior: HitTestBehavior.opaque,
              // // child: const SizedBox.expand(),
            ),
            Positioned(
              top: offset.dy,
              right: 10,
              child: const _ProfileDropdownMenu(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Image.asset('assets/images/logo.png'),
      ),
      actions: [
        SvgPicture.asset(
          "assets/icons/notification.svg",
          height: 22,
          color: Colors.white,
        ),
        const SizedBox(width: 16),
        GestureDetector(
          key: _avatarKey,
          onTap: () => _showProfileDropdown(context),
          child: const CircleAvatar(
            radius: 22,
            foregroundImage: AssetImage("assets/images/demo_user.jpg"),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

/// ─────────────────────────────────────────────
///  Dropdown Menu Widget
/// ─────────────────────────────────────────────
class _ProfileDropdownMenu extends StatelessWidget {
  const _ProfileDropdownMenu();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// ── Arrow pointer sitting ABOVE the card, pointing up toward avatar
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CustomPaint(
              size: const Size(20, 10),
              painter: ArrowPainter(),
            ),
          ),

          /// ── Dropdown Card
          Container(
            width: 220,
            decoration: BoxDecoration(
              color: const Color(0xFF0D1F33),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFF1E3A55), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 24,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// ── User Info Header
                  Padding(
                    padding:
                    const EdgeInsets.fromLTRB(16, 12, 16, 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tasmia Hassan Shabonty',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'View Profile',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.55),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  _divider(),

                  /// ── Main Menu Items
                  _menuItem(
                    icon: Icons.bookmark_border_rounded,
                    label: 'Bookmarks',
                    onTap: () => _onTap(context, 'Bookmarks'),
                  ),
                  _divider(),
                  _menuItem(
                    icon: Icons.menu_rounded,
                    label: 'Watchlist',
                    onTap: () => _onTap(context, 'Watchlist'),
                  ),
                  _divider(),
                  _menuItem(
                    iconWidget: SvgPicture.asset("assets/icons/rate_fill.svg",color: AppColors.whiteColor,),
                    label: 'Ratings',
                    onTap: () => _onTap(context, 'Ratings'),
                  ),
                  _divider(),
                  _menuItem(
                    icon: Icons.repeat_rounded,
                    label: 'Repost',
                    onTap: () => _onTap(context, 'Repost'),
                  ),
                  _divider(),
                  _menuItem(
                    icon: Icons.favorite_border_rounded,
                    label: 'Favorite',
                    onTap: () => _onTap(context, 'Favorite'),
                  ),

                  _divider(thick: true),

                  /// ── Settings Group
                  _menuItem(
                    icon: Icons.edit_outlined,
                    label: 'Edit Profile',
                    onTap: () => _onTap(context, 'Edit Profile'),
                  ),
                  _divider(),
                  _menuItem(
                    icon: Icons.settings_outlined,
                    label: 'Settings',
                    onTap: () => _onTap(context, 'Settings'),
                  ),

                  _divider(thick: true),

                  /// ── Logout
                  _menuItem(
                    icon: Icons.logout_rounded,
                    label: 'Logout',
                    onTap: () => _onTap(context, 'Logout'),
                  ),

                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, String action) {
    Navigator.of(context).pop();
    debugPrint('$action tapped');
    // TODO: handle navigation
  }

  Widget _divider({bool thick = false}) {
    return Container(
      height: thick ? 1.5 : 0.5,
      color: thick
          ? const Color(0xFF1E3A55)
          : Colors.white.withOpacity(0.08),
    );
  }


  Widget _menuItem({
    IconData? icon,
    Widget? iconWidget,
    String? svgPath,  // New parameter for SVG path
    double svgSize = 20,  // Optional SVG size parameter
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white.withOpacity(0.05),
      highlightColor: Colors.white.withOpacity(0.03),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        child: Row(
          children: [
            SizedBox(
              width: 22,
              height: 22,
              child: iconWidget ??
                  (svgPath != null
                      ? SvgPicture.asset(
                    svgPath,
                    width: svgSize,
                    height: svgSize,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  )
                      : Icon(icon, color: Colors.white, size: 20)),
            ),
            const SizedBox(width: 14),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.5,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/







import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import '../../widgets/home_widget/dropdown_arrow.dart';
import '../self_user/self_profile/self_profile_screen.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> {
  final GlobalKey _avatarKey = GlobalKey();

  void _showProfileDropdown(BuildContext context) {
    final RenderBox renderBox =
    _avatarKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => Get.back(),
            ),
            Positioned(
              top: offset.dy,
              right: 10,
              child: const _ProfileDropdownMenu(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Image.asset('assets/images/logo.png'),
      ),
      actions: [
        SvgPicture.asset(
          "assets/icons/notification.svg",
          height: 22,
          color: Colors.white,
        ),
        const SizedBox(width: 16),
        GestureDetector(
          key: _avatarKey,
          onTap: () => _showProfileDropdown(context),
          child: const CircleAvatar(
            radius: 22,
            foregroundImage: AssetImage("assets/images/demo_user.jpg"),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

/// ─────────────────────────────────────────────
///  Dropdown Menu Widget
/// ─────────────────────────────────────────────
class _ProfileDropdownMenu extends StatelessWidget {
  const _ProfileDropdownMenu();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// ── Arrow pointer sitting ABOVE the card, pointing up toward avatar
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CustomPaint(
              size: const Size(20, 10),
              painter: ArrowPainter(),
            ),
          ),

          /// ── Dropdown Card
          Container(
            width: 220,
            decoration: BoxDecoration(
              color: const Color(0xFF0D1F33),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFF1E3A55), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 24,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ── User Info Header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tasmia Hassan Shabonty',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'View Profile',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.55),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  _divider(),

                  /// ── Main Menu Items
                  _menuItem(
                    icon: Icons.bookmark_border_rounded,
                    label: 'Bookmarks',
                    onTap: () => _onTap(context, 'bookmarks'),
                  ),
                  _divider(),
                  _menuItem(
                    icon: Icons.menu_rounded,
                    label: 'Watchlist',
                    onTap: () => _onTap(context, 'watchlist'),
                  ),
                  _divider(),
                  _menuItem(
                    iconWidget: SvgPicture.asset(
                      "assets/icons/rate_fill.svg",
                      color: AppColors.whiteColor,
                    ),
                    label: 'Ratings',
                    onTap: () => _onTap(context, 'ratings'),
                  ),
                  _divider(),
                  _menuItem(
                    icon: Icons.repeat_rounded,
                    label: 'Repost',
                    onTap: () => _onTap(context, 'repost'),
                  ),
                  _divider(),
                  _menuItem(
                    icon: Icons.favorite_border_rounded,
                    label: 'Favorite',
                    onTap: () => _onTap(context, 'favorite'),
                  ),

                  _divider(thick: true),

                  /// ── Settings Group
                  _menuItem(
                    icon: Icons.edit_outlined,
                    label: 'Edit Profile',
                    onTap: () => _onTap(context, 'edit_profile'),
                  ),
                  _divider(),
                  _menuItem(
                    icon: Icons.settings_outlined,
                    label: 'Settings',
                    onTap: () => _onTap(context, 'settings'),
                  ),

                  _divider(thick: true),

                  /// ── Logout
                  _menuItem(
                    icon: Icons.logout_rounded,
                    label: 'Logout',
                    onTap: () => _onTap(context, 'logout'),
                  ),

                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context, String action) {
    Navigator.of(context).pop(); // Close dropdown first

    switch (action) {
      case 'profile': debugPrint("ok");
        // Get.to(() => const ProfileScreen());
        break;
      case 'bookmarks': debugPrint("ok");
        // Get.to(() => const BookmarksScreen());
        break;
      case 'watchlist': debugPrint("ok");
        // Get.to(() => const WatchlistScreen());
        break;
      case 'ratings': debugPrint("ok");
        // Get.to(() => const RatingsScreen());
        break;
      case 'repost': debugPrint("ok");
        // Get.to(() => const RepostScreen());
        break;
      case 'favorite': debugPrint("ok");
        // Get.to(() => const FavoriteScreen());
        break;
      case 'edit_profile': debugPrint("ok");
        // Get.to(() => const EditProfileScreen());
        break;
      case 'settings':
        Get.to(() => const SelfProfileScreen());
        break;
      case 'logout':
        _showLogoutDialog(context);
        break;
    }
  }

  void _showLogoutDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFF0D1F33),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          'Logout',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'Are you sure you want to logout?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back(); // Close dialog
              // TODO: Add your logout logic here
              // Example: AuthService.logout();
              Get.offAllNamed('/login'); // Navigate to login screen
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFe94560),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _divider({bool thick = false}) {
    return Container(
      height: thick ? 1.5 : 0.5,
      color: thick
          ? const Color(0xFF1E3A55)
          : Colors.white.withOpacity(0.08),
    );
  }

  Widget _menuItem({
    IconData? icon,
    Widget? iconWidget,
    String? svgPath,
    double svgSize = 20,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white.withOpacity(0.05),
      highlightColor: Colors.white.withOpacity(0.03),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        child: Row(
          children: [
            SizedBox(
              width: 22,
              height: 22,
              child: iconWidget ??
                  (svgPath != null
                      ? SvgPicture.asset(
                    svgPath,
                    width: svgSize,
                    height: svgSize,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  )
                      : Icon(icon, color: Colors.white, size: 20)),
            ),
            const SizedBox(width: 14),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.5,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}