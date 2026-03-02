/// Onboard Page 4
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class OnboardPage4 extends StatelessWidget {
  const OnboardPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No lectures. just clarity.',
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
                image: AssetImage('assets/images/onboard_image_4.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 60),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/star.svg"),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 260, // Fixed width for all texts
                    child: Text(
                        'Community + AI-assisted ratings',
                        style: AppTextStyle.defaultTextStyle.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/star.svg"),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 260, // Same fixed width
                    child: Text(
                        'No censorship, no bans',
                        style: AppTextStyle.defaultTextStyle.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/star.svg"),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 260, // Same fixed width
                    child: Text(
                        'Decide what you watch',
                        style: AppTextStyle.defaultTextStyle.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}