import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/hero_section.png",
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}