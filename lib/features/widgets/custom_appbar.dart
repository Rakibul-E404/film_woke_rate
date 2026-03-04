import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:woke_movie_rating/features/widgets/custom_background.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Stack(
        children: [
          // Centered title with stars
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: AppTextStyle.largeHeadingFranchise.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset("assets/icons/star_with_background_shade.svg"),
              ],
            ),
          ),
          // Back button
          if (showBackButton)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back_outlined, color: AppColors.whiteColor),
                onPressed: () => Get.back(),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60); // AppBar height
}