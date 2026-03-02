/// Onboard Page 2
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class OnboardPage2 extends StatelessWidget {
  const OnboardPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'One simple scale\n',
            style: AppTextStyle.largeHeadingFranchise.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/onboard_image_2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Higher stars = more messaging\nLower stars = story first',
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