import 'package:flutter/material.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const ActionButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.borderColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}