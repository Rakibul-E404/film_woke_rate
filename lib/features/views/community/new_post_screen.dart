import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import '../../widgets/custom_background.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          CustomBackground(),
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildMainCard(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          Row(
            children: [
              SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
              const Text(
                'NEW POST',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
            ],
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildMainCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info section (fixed at top)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  foregroundImage: const AssetImage("assets/images/demo_user.jpg"),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Miranda Baju',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // Scrollable text input area (takes remaining space)
          Expanded(
            child: SingleChildScrollView(
              // ✅ Push content above keyboard
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  maxLines: null,
                  minLines: 5,
                  style: const TextStyle(color: Colors.white70, fontSize: 15),
                  decoration: const InputDecoration(
                    hintText: 'Say something...',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ),

          // ✅ FIXED BOTTOM SECTION (always visible)
          Column(
            children: [
              // Divider
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(color: Colors.white24, height: 1),
              ),

              // Bottom action section (always at bottom)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.image_outlined,
                            color: Colors.white70,
                          ),
                          onPressed: () {},
                          iconSize: 24,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.videocam_outlined,
                            color: Colors.white70,
                          ),
                          onPressed: () {},
                          iconSize: 24,
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE74C3C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Post',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}