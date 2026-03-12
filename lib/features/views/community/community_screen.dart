import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/community/report_post_sheet.dart';
import '../../widgets/custom_background.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        child: Center(
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
                      ),
                      const SizedBox(width: 24)
                    ],
                  ),
                ),

                /// Post Input
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
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/demo_user.jpg"),
                        ),
                        SizedBox(width: 10),

                        Expanded(
                          child: Text(
                            "Share your thoughts!",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),

                        Icon(CupertinoIcons.photo, size: 18, color: Colors.white),
                        SizedBox(width: 8),
                        Icon(CupertinoIcons.video_camera_solid, color: Colors.white),
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
                    itemCount: 1000,
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

                              /// User Info
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


                                  const Icon(Icons.cancel_outlined,
                                      color: Colors.white70)
                                ],
                              ),

                              const SizedBox(height: 10),

                              /// Post text
                              Text(
                                "This is demo community post #${index + 1}. Scroll to see more posts.",
                                style: const TextStyle(color: Colors.white),
                              ),

                              const SizedBox(height: 12),

                              /// Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  "assets/images/movie_poster2.png",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),

                              const SizedBox(height: 12),

                              /// Actions
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

                                  const Icon(CupertinoIcons.chat_bubble,
                                      color: Colors.white70),
                                  const SizedBox(width: 4),
                                  Text("${200 + index}",
                                      style: const TextStyle(color: Colors.white70)),

                                  const SizedBox(width: 20),
                                  // const Spacer(),

                                  const Icon(CupertinoIcons.arrow_2_squarepath,
                                      color: Colors.white70),
                                  const Spacer(),
                                  /// OPEN REPORT POPUP
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




