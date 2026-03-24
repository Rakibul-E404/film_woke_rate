// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import '../../../utils/app_colors.dart';
// import '../../../utils/app_text_styles.dart';
// import '../../../widgets/custom_background.dart';
//
// class SelfProfileScreen extends StatelessWidget {
//   const SelfProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomBackground(
//         child: SafeArea(
//           child: Column(
//             children: [
//               // Scrollable content
//               Expanded(
//                 child: SingleChildScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   child: Column(
//                     children: [
//                       // Profile Section with Background Image and Header Overlay
//                       Stack(
//                         clipBehavior: Clip.none,
//                         children: [
//                           // Background Image Container
//                           Container(
//                             height: 200,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               image: const DecorationImage(
//                                 image: AssetImage(
//                                   'assets/images/demo_profile_cover.png',
//                                 ),
//                                 fit: BoxFit.cover,
//                               ),
//                               borderRadius: const BorderRadius.only(
//                                 bottomLeft: Radius.circular(0),
//                                 bottomRight: Radius.circular(0),
//                               ),
//                             ),
//                           ),
//                           // Header Overlay on Cover Photo
//                           Positioned(
//                             top: 0,
//                             left: 0,
//                             right: 0,
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 16,
//                                 vertical: 12,
//                               ),
//                               child: Row(
//                                 children: [
//                                   IconButton(
//                                     icon: const Icon(
//                                       Icons.arrow_back,
//                                       color: Colors.white,
//                                     ),
//                                     onPressed: () => Get.back(),
//                                   ),
//                                   const SizedBox(width: 25),
//                                   Expanded(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         SvgPicture.asset(
//                                           "assets/icons/star_with_background_shade.svg",
//                                           height: 20,
//                                           width: 20,
//                                         ),
//                                         const SizedBox(width: 8),
//                                         Text(
//                                           'VIEW PROFILE',
//                                           textAlign: TextAlign.center,
//                                           style: AppTextStyle.largeHeadingFranchise?.copyWith(
//                                             fontSize: 28,
//                                             fontWeight: FontWeight.bold,
//                                             shadows: [
//                                               Shadow(
//                                                 color: Colors.black.withValues(alpha: 0.5),
//                                                 blurRadius: 4,
//                                                 offset: const Offset(0, 2),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         const SizedBox(width: 8),
//                                         SvgPicture.asset(
//                                           "assets/icons/star_with_background_shade.svg",
//                                           height: 20,
//                                           width: 20,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(width: 48),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // Profile Picture - Positioned to overlap half
//                           Positioned(
//                             bottom: -60,
//                             left: 0,
//                             right: 0,
//                             child: Center(
//                               child: Container(
//                                 width: 120,
//                                 height: 120,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                     color: AppColors.primaryColor,
//                                     width: 4,
//                                   ),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black.withValues(
//                                         alpha: 0.3,
//                                       ),
//                                       blurRadius: 8,
//                                       offset: const Offset(0, 2),
//                                     ),
//                                   ],
//                                 ),
//                                 child: const CircleAvatar(
//                                   radius: 58,
//                                   backgroundImage: AssetImage(
//                                     'assets/images/demo_user.jpg',
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           // Username - Positioned below the profile picture
//                           Positioned(
//                             bottom: -120,
//                             left: 0,
//                             right: 0,
//                             child: Center(
//                               child: Text(
//                                 'Tasmiashabu',
//                                 style: AppTextStyle.smallText
//                                     ?.copyWith(
//                                     fontSize: 24,
//                                     color: AppColors.whiteColor,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 140),
//                       // Menu Items
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: Column(
//                           children: [
//                             _buildMenuItem(
//                               icon: Icons.person_outline,
//                               title: 'User Profile',
//                               onTap: () {
//                                 // Navigate to User Profile
//                               },
//                             ),
//                             const SizedBox(height: 12),
//                             _buildMenuItem(
//                               icon: Icons.tune,
//                               title: 'Settings',
//                               onTap: () {
//                                 /// Get.to(() => const SettingsScreen());
//                               },
//                             ),
//                             const SizedBox(height: 12),
//                             _buildMenuItem(
//                               icon: Icons.workspace_premium_outlined,
//                               title: 'Subscription',
//                               onTap: () {
//                                 // Navigate to Subscription
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       // // Add extra space to push content up when keyboard appears
//                       // const SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ),
//               // Logout Button - Fixed at bottom
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: _buildLogoutButton(context),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMenuItem({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.secondaryColor,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.2),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: onTap,
//           borderRadius: BorderRadius.circular(12),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//             child: Row(
//               children: [
//                 Icon(icon, color: AppColors.whiteColor, size: 22),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Text(
//                     title,
//                     style: AppTextStyle.defaultTextStyle,
//                   ),
//                 ),
//                 Icon(
//                   Icons.arrow_forward_ios,
//                   color: AppColors.whiteColor,
//                   size: 16,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLogoutButton(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 52,
//       decoration: BoxDecoration(
//         color: const Color(0xFFe94560),
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFFe94560).withValues(alpha: 0.3),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: () => _showLogoutDialog(context),
//           borderRadius: BorderRadius.circular(12),
//           child:  Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 20),
//                 child: Row(
//                   children: [
//                     Icon(Icons.logout, color: Colors.white),
//                     SizedBox(width: 12),
//                     Text(
//                       'Logout',
//                       style: AppTextStyle.defaultTextStyle,
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(right: 20),
//                 child: Icon(
//                   Icons.arrow_forward_ios,
//                   color: Colors.white,
//                   size: 18,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showLogoutDialog(BuildContext context) {
//     Get.dialog(
//       AlertDialog(
//         backgroundColor: const Color(0xFF0D1F33),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         title: const Text(
//           'Logout',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         content: const Text(
//           'Are you sure you want to logout?',
//           style: TextStyle(color: Colors.white70),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(),
//             child: const Text(
//               'Cancel',
//               style: TextStyle(color: Colors.white70),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Get.back();
//               // Add your logout logic here
//               Get.offAllNamed('/login');
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFFe94560),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text('Logout', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../widgets/custom_background.dart';
import '../../subscription/subscription_screen.dart';

class SelfProfileScreen extends StatelessWidget {
  const SelfProfileScreen({super.key});

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
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/demo_profile_cover.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                            ),
                          ),
                          // Header Overlay on Cover Photo
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/star_with_background_shade.svg",
                                          height: 20,
                                          width: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'VIEW PROFILE',
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle.largeHeadingFranchise?.copyWith(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black.withValues(alpha: 0.5),
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
                          ),
                          // Profile Picture - Positioned to overlap half
                          Positioned(
                            bottom: -60,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                    width: 4,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.3,
                                      ),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  radius: 58,
                                  backgroundImage: AssetImage(
                                    'assets/images/demo_user.jpg',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Username - Positioned below the profile picture
                          Positioned(
                            bottom: -120,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                'Tasmiashabu',
                                style: AppTextStyle.smallText
                                    ?.copyWith(
                                    fontSize: 24,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 140),
                      // Menu Items
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            _buildMenuItem(
                              icon: Icons.person_outline,
                              title: 'User Profile',
                              onTap: () {
                                // Navigate to User Profile
                              },
                            ),
                            const SizedBox(height: 12),
                            _buildMenuItem(
                              icon: Icons.tune,
                              title: 'Settings',
                              onTap: () {
                                /// Get.to(() => const SettingsScreen());
                              },
                            ),
                            const SizedBox(height: 12),
                            _buildMenuItem(
                              svgIcon: "assets/icons/premium_icon.svg",
                              title: 'Subscription',
                              onTap: () {
                                Get.to(() => const SubscriptionScreen());
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              // Logout Button - Fixed at bottom
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildLogoutButton(context),
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
                  child: Text(
                    title,
                    style: AppTextStyle.defaultTextStyle,
                  ),
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

  Widget _buildLogoutButton(BuildContext context) {
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
          onTap: () => _showLogoutDialog(context),
          borderRadius: BorderRadius.circular(12),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.white),
                    SizedBox(width: 12),
                    Text(
                      'Logout',
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
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              // Add your logout logic here
              Get.offAllNamed('/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFe94560),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}