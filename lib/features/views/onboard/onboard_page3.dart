/// Onboard Page 3
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class OnboardPage3 extends StatelessWidget {
  const OnboardPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 450,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/onboard_image_3.png'),
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