/// Onboard Page 1
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class OnboardPage1 extends StatelessWidget {
  const OnboardPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Watch what you want - not what preaches',
            style: AppTextStyle.largeHeadingFranchise.copyWith(
              color: Colors.white,
              height: 1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 44),
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/onboard_image_1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'See how much messaging is in a movie or TV show before you press play.',
            style: AppTextStyle.defaultTextStyle.copyWith(
              color: AppColors.whiteColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}