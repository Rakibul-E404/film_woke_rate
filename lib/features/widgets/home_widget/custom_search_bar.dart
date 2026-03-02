import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFF0e1c28), // Dark blue shade like screenshot
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        cursorColor: AppColors.whiteColor,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: AppTextStyle.defaultTextStyle,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white70,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}