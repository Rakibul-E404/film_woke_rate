import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../widgets/community/report_post_sheet.dart';
import '../../widgets/custom_background.dart';

class PostDetailScreen extends StatelessWidget {
  final String text;

  const PostDetailScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1a2744),
      body: Stack(
        children: [
          const CustomBackground(),
          SafeArea(
            child: Column(
              children: [
                /// Header with back button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      /// POST CARD
                      Container(
                        padding: const EdgeInsets.all(16),
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
                                  radius: 20,
                                  backgroundImage: AssetImage("assets/images/demo_user.jpg"),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            "Miranda Baju",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "Follow",
                                            style: TextStyle(
                                              color: Color(0xffE74C3C),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        "Posted 20mins ago",
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            /// Post Text
                            Text(
                              text,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                height: 1.5,
                              ),
                            ),

                            const SizedBox(height: 16),

                            /// Post Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                "assets/images/movie_poster2.png",
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// Action Buttons
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xff203B4F),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            /// Upvote
                            Row(
                              children: [
                                const Icon(CupertinoIcons.arrow_up, color: Colors.white70, size: 22),
                                const SizedBox(width: 4),
                                const Text(
                                  "1.5k",
                                  style: TextStyle(color: Colors.white70, fontSize: 14),
                                ),
                              ],
                            ),

                            const SizedBox(width: 20),

                            /// Downvote
                            const Icon(CupertinoIcons.arrow_down, color: Colors.white70, size: 22),

                            const SizedBox(width: 30),

                            /// Comment
                            Row(
                              children: [
                                const Icon(CupertinoIcons.chat_bubble, color: Colors.white70, size: 22),
                                const SizedBox(width: 4),
                                const Text(
                                  "319",
                                  style: TextStyle(color: Colors.white70, fontSize: 14),
                                ),
                              ],
                            ),

                            const SizedBox(width: 30),

                            /// Share
                            const Icon(CupertinoIcons.arrow_2_squarepath, color: Colors.white70, size: 22),

                            const Spacer(),

                            /// More
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: Get.context!,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (_) => const ReportPostSheet(),
                                );
                              },
                              child: const Icon(
                                Icons.more_horiz,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// Comment Input
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: const [
                            CircleAvatar(
                              radius: 18,
                              backgroundImage: AssetImage("assets/images/demo_user.jpg"),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                "Add Your Review",
                                style: TextStyle(color: Colors.white54, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// Tabs
                      Row(
                        children: [
                          const Text(
                            "Comments",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Text(
                                "Recommended",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(Icons.keyboard_arrow_down, color: Colors.white70, size: 18),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      /// Comment Item 1
                      _buildCommentItem(
                        name: "Miranda Baju",
                        time: "posted 20mins ago",
                        comment: "Mel Brooks was preparing for this film, he discovered that Ken Strickfaden.",
                        upvotes: "1.5k",
                      ),

                      const SizedBox(height: 16),

                      /// Comment Item 2
                      _buildCommentItem(
                        name: "Miranda Baju",
                        time: "posted 20mins ago",
                        comment: "Mel Brooks was preparing for this film, he discovered that Ken Strickfaden.",
                        upvotes: "1.5k",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem({
    required String name,
    required String time,
    required String comment,
    required String upvotes,
    bool showPlaceholder = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xff203B4F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage("assets/images/demo_user.jpg"),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (comment.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              comment,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(CupertinoIcons.arrow_up, color: Colors.white70, size: 18),
                const SizedBox(width: 4),
                Text(
                  upvotes,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const SizedBox(width: 16),
                const Icon(CupertinoIcons.arrow_down, color: Colors.white70, size: 18),
                const SizedBox(width: 24),
                const Text(
                  "Reply",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: Get.context!,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const ReportPostSheet(),
                    );
                  },
                  child: const Icon(
                    Icons.more_horiz,
                    color: Colors.white70,
                    size: 14,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}