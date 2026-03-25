import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:woke_movie_rating/features/views/auth/password/change_password_screen.dart';
import 'package:woke_movie_rating/features/views/self_user/self_profile/edit_self_profile_screen.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/custom_background.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // Profile Section with Background Image and Header Overlay
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Background Image Container
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => Get.back(),
                                ),
                                const SizedBox(width: 25),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/star_with_background_shade.svg",
                                        height: 20,
                                        width: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Settings',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle
                                            .largeHeadingFranchise
                                            ?.copyWith(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black
                                                  .withValues(alpha: 0.5),
                                              blurRadius: 4,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      SvgPicture.asset(
                                        "assets/icons/star_with_background_shade.svg",
                                        height: 20,
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 48),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Menu Items
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            _buildMenuItem(
                              icon: Icons.lock,
                              title: 'Change Password',
                              onTap: () {
                                // Navigate to User Profile
                                Get.to(() => const ChangePasswordScreen());
                              },
                            ),
                            const SizedBox(height: 12),
                            _buildMenuItem(
                              icon: Icons.bookmark,
                              title: 'Saved Post',
                              onTap: () {
                                /// Get.to(() => const SettingsScreen());
                              },
                            ),
                            const SizedBox(height: 12),
                            _buildMenuItem(
                              icon: Icons.notifications_active,
                              title: 'Notifications',
                              onTap: () {
                                /// Get.to(() => const SettingsScreen());
                              },
                            ),
                            const SizedBox(height: 12),
                            _buildMenuItem(
                              icon: Icons.shopping_bag,
                              title: 'Sharing',
                              onTap: () {
                                /// Get.to(() => const SettingsScreen());
                              },
                            ),
                            const SizedBox(height: 12),
                            _buildMenuItem(
                              icon: CupertinoIcons.doc_text_fill,
                              title: 'Terms and Conditions',
                              onTap: () {
                                /// Get.to(() => const SettingsScreen());
                              },
                            ),
                            const SizedBox(height: 12),
                            _buildMenuItem(
                              icon: CupertinoIcons.checkmark_shield_fill,
                              title: 'Privacy Policy',
                              onTap: () {
                                /// Get.to(() => const SettingsScreen());
                              },
                            ),
                            const SizedBox(height: 12),
                            _buildMenuItem(
                              icon: Icons.report_problem,
                              title: 'Report a problem',
                              onTap: () {
                                /// Get.to(() => const SettingsScreen());
                              },
                            ),
                            const SizedBox(height: 12),
                            _buildMenuItem(
                              icon: Icons.help,
                              title: 'FAQ',
                              onTap: () {
                                /// Get.to(() => const SettingsScreen());
                              },
                            ),
                            const SizedBox(height: 12),
                            // _buildMenuItem(
                            //   icon: Icons.no_accounts,
                            //   title: 'Delete Account',
                            //   onTap: () {
                            //     /// Get.to(() => const SettingsScreen());
                            //   },
                            // ),
                            // const SizedBox(height: 12),
                            _buildDeleteAccountButton(context),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    IconData? icon,
    String? svgIcon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                // Support both Icon and SVG
                if (icon != null)
                  Icon(icon, color: AppColors.whiteColor, size: 22)
                else if (svgIcon != null)
                  SvgPicture.asset(
                    svgIcon,
                    height: 22,
                    width: 22,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(title, style: AppTextStyle.defaultTextStyle),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.whiteColor,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteAccountButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFFe94560),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFe94560).withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => {
            ///todo
          },
          borderRadius: BorderRadius.circular(12),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(Icons.no_accounts, color: Colors.white),
                    SizedBox(width: 12),
                    Text(
                      'Delete Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
