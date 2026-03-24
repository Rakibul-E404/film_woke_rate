/**
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/views/community/new_post_screen.dart';
import 'package:woke_movie_rating/features/views/community/post_details_screen.dart';

import '../../widgets/community/report_post_sheet.dart';
import '../../widgets/custom_background.dart' ;

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {

    String demoText =
        "When Mel Brooks was preparing for this film, he discovered that Ken Strickfaden who'd made the elaborate electrical machinery for the lab sequences in Frankenstein (1931) and its sequels, was still alive and living in the Los Angeles area.";

    return Scaffold(
      body: Stack(
        children: [
          const CustomBackground(),

          SafeArea(
            child: Column(
              children: [

                /// Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
                            const SizedBox(width: 8),
                            const Text(
                              "COMMUNITY",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                            const SizedBox(width: 8),
                            SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24)
                    ],
                  ),
                ),

                /// Post input
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.05),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage("assets/images/demo_user.jpg"),
                        ),
                        const SizedBox(width: 10),
                         Expanded(
                          child: GestureDetector(
                            onTap: (){Get.to(()=>NewPostScreen());},
                            child: Container(
                              decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Share your thoughts!",
                                style: TextStyle(color: AppColors.greyColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(CupertinoIcons.photo, size: 18, color: Colors.white),
                        const SizedBox(width: 8),
                        const Icon(CupertinoIcons.video_camera_solid, color: Colors.white),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// Feed
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 50,
                    itemBuilder: (context, index) {

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xff203B4F),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              /// USER INFO
                              Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: AssetImage("assets/images/demo_user.jpg"),
                                  ),
                                  const SizedBox(width: 10),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            "Miranda Baju",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 6),
                                          Text(
                                            "Follow",
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Posted ${index + 1} mins ago",
                                        style: const TextStyle(
                                            color: Colors.white70, fontSize: 12),
                                      )
                                    ],
                                  ),

                                  const Spacer(),
                                  const Icon(Icons.close,
                                      color: Colors.white70)
                                ],
                              ),

                              const SizedBox(height: 10),

                              /// POST TEXT (3 line limit)
                              Text(
                                demoText,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white),
                              ),

                              const SizedBox(height: 4),

                              /// SEE MORE
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PostDetailScreen(
                                        text: demoText,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "See more",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 12),

                              /// IMAGE
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PostDetailScreen(
                                        text: demoText,
                                      ),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    "assets/images/movie_poster2.png",
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 12),

                              /// ACTIONS
                              Row(
                                children: [
                                  const Icon(CupertinoIcons.arrow_up,
                                      color: Colors.white70),
                                  const SizedBox(width: 4),
                                  Text("${index + 1}k",
                                      style: const TextStyle(color: Colors.white70)),

                                  const SizedBox(width: 4),
                                  const Icon(CupertinoIcons.arrow_down,
                                      color: Colors.white70),

                                  const SizedBox(width: 20),

                                  /// OPEN POST DETAIL
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => PostDetailScreen(
                                            text: demoText,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        const Icon(CupertinoIcons.chat_bubble,
                                            color: Colors.white70),
                                        const SizedBox(width: 4),
                                        Text("${200 + index}",
                                            style: const TextStyle(color: Colors.white70)),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 20),

                                  const Icon(CupertinoIcons.arrow_2_squarepath,
                                      color: Colors.white70),

                                  const Spacer(),

                                  /// REPORT
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (_) => const ReportPostSheet(),
                                      );
                                    },
                                    child: const Icon(Icons.more_horiz,
                                        color: Colors.white70),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/




///
///
///
/// todo:: making the bottomnav floating
///
///
///
///


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/views/community/new_post_screen.dart';
import 'package:woke_movie_rating/features/views/community/post_details_screen.dart';

import '../../widgets/community/report_post_sheet.dart';
import '../../widgets/custom_background.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String demoText =
        "When Mel Brooks was preparing for this film, he discovered that Ken Strickfaden who'd made the elaborate electrical machinery for the lab sequences in Frankenstein (1931) and its sequels, was still alive and living in the Los Angeles area.";

    return Scaffold(
      // 🔑 KEY CHANGE #1: Allow body to extend behind BottomNavigationBar
      extendBody: true,

      body: Stack(
        children: [
          const CustomBackground(),

          // 🔑 KEY CHANGE #2: Allow content to extend behind bottom nav
          SafeArea(
            bottom: false, // ⚠️ Critical: content can go behind bottom nav
            child: Column(
              children: [
                /// Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
                            const SizedBox(width: 8),
                            const Text(
                              "COMMUNITY",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                            const SizedBox(width: 8),
                            SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24)
                    ],
                  ),
                ),

                /// Post input
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.05),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage("assets/images/demo_user.jpg"),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){Get.to(()=>NewPostScreen());},
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Share your thoughts!",
                                style: TextStyle(color: AppColors.greyColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(CupertinoIcons.photo, size: 18, color: Colors.white),
                        const SizedBox(width: 8),
                        const Icon(CupertinoIcons.video_camera_solid, color: Colors.white),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// Feed
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    // 🔑 KEY CHANGE #3: Add bottom padding so last items clear the nav bar
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                        .add(const EdgeInsets.only(bottom: 100)), // ⚠️ ~height of bottom nav + safe area
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xff203B4F),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// USER INFO
                              Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: AssetImage("assets/images/demo_user.jpg"),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            "Miranda Baju",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 6),
                                          Text(
                                            "Follow",
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Posted ${index + 1} mins ago",
                                        style: const TextStyle(
                                            color: Colors.white70, fontSize: 12),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.close,
                                      color: Colors.white70)
                                ],
                              ),

                              const SizedBox(height: 10),

                              /// POST TEXT (3 line limit)
                              Text(
                                demoText,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white),
                              ),

                              const SizedBox(height: 4),

                              /// SEE MORE
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PostDetailScreen(
                                        text: demoText,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "See more",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 12),

                              /// IMAGE
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PostDetailScreen(
                                        text: demoText,
                                      ),
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    "assets/images/movie_poster2.png",
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 12),

                              /// ACTIONS
                              Row(
                                children: [
                                  const Icon(CupertinoIcons.capslock,
                                      color: Colors.white70),
                                  const SizedBox(width: 4),
                                  Text("${index + 1}k",
                                      style: const TextStyle(color: Colors.white70)),

                                  const SizedBox(width: 4),
                                  const Icon(CupertinoIcons.arrow_down,
                                      color: Colors.white70),

                                  const SizedBox(width: 20),

                                  /// OPEN POST DETAIL
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => PostDetailScreen(
                                            text: demoText,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        const Icon(CupertinoIcons.chat_bubble,
                                            color: Colors.white70),
                                        const SizedBox(width: 4),
                                        Text("${200 + index}",
                                            style: const TextStyle(color: Colors.white70)),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 20),

                                  const Icon(CupertinoIcons.arrow_2_squarepath,
                                      color: Colors.white70),

                                  const Spacer(),

                                  /// REPORT
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (_) => const ReportPostSheet(),
                                      );
                                    },
                                    child: const Icon(Icons.more_horiz,
                                        color: Colors.white70),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}