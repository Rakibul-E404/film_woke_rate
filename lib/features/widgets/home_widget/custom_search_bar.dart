import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../views/search/search_result_screen.dart';

class CustomSearchBar extends StatelessWidget {
  final bool isTappable;  // When true, tapping navigates
  final bool isEditable;  // When true, allows typing
  final VoidCallback? onTap;
  final TextEditingController? controller;

  // 👇 NEW: Focus & Keyboard Support
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;

  const CustomSearchBar({
    super.key,
    this.isTappable = true,
    this.isEditable = false,
    this.onTap,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.onSubmitted,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Only trigger onTap if tapping the container (not the TextField)
      // TextField handles its own focus, so we use behavior: deferToChild
      behavior: HitTestBehavior.deferToChild,
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else if (isTappable && !isEditable) {
          // Navigate only if it's tappable and not editable
          Get.to(() => SearchResultScreen());
        }
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: const Color(0xFF0e1c28),
          borderRadius: BorderRadius.circular(14),
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode, // 👈 Forward FocusNode
          enabled: isEditable,
          style: const TextStyle(color: Colors.white),
          cursorColor: AppColors.whiteColor,
          textInputAction: textInputAction, // 👈 Forward keyboard action
          onSubmitted: onSubmitted, // 👈 Forward submit callback
          onEditingComplete: onEditingComplete, // 👈 Forward editing complete
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: AppTextStyle.defaultTextStyle.copyWith(
              color: Colors.white.withOpacity(0.7),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white70,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}