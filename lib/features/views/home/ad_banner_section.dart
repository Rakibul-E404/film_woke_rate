import 'package:flutter/material.dart';

class AdBannerSection extends StatelessWidget {
  const AdBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          "assets/images/ad_banner.png",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}