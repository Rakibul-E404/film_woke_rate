import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';

class MovieRatingWidget extends StatefulWidget {
  const MovieRatingWidget({super.key});

  @override
  State<MovieRatingWidget> createState() => _MovieRatingWidgetState();
}

class _MovieRatingWidgetState extends State<MovieRatingWidget> {
  double movieRating = 1;
  double wokeRating = 1;

  Widget buildRating(String title, double value, Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        _CustomDotSlider(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff203b52),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// DONE BUTTON
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.redColor,
                foregroundColor: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
              ),
              onPressed: () {
                print("Movie: $movieRating");
                print("Woke: $wokeRating");
                Get.back();
              },
              child: Text("Done", style: AppTextStyle.defaultTextStyle),
            ),
          ),
          const SizedBox(height: 20),

          buildRating(
            "RATE THIS MOVIES",
            movieRating,
                (v) => setState(() => movieRating = v),
          ),
          const SizedBox(height: 28),

          buildRating(
            "HOW WOKE WAS THIS MOVIE?",
            wokeRating,
                (v) => setState(() => wokeRating = v),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Custom Dot Slider
//
//  Design:
//  • Track:  dark bar full width
//  • Trail:  grey filled bar from left edge up to thumb
//  • Dots:   larger circles at each step — act as a visible ring
//  • Thumb:  small filled circle that sits INSIDE the active dot
//            so the dot ring is always visible around the thumb
// ─────────────────────────────────────────────────────────────
class _CustomDotSlider extends StatelessWidget {
  final double value; // 1..10
  final Function(double) onChanged;

  const _CustomDotSlider({
    required this.value,
    required this.onChanged,
  });

  static const int _steps = 10;
  static const double _trackHeight = 4.0;

  // Dot is the OUTER ring — larger
  static const double _dotRadius = 9.0;

  // Thumb is the INNER filled circle — smaller than dot
  // so the dot ring stays visible around it
  static const double _thumbRadius = 5.0;

  static const double _numberAreaHeight = 26.0;

  // Colors
  static const Color _trackColor = AppColors.secondaryColor;
  static const Color _trailColor = AppColors.ratingProgressColor;  // grey trail
  static const Color _dotColor = AppColors.secondaryColor;    // dot fill (dark)
  static const Color _dotBorderColor = AppColors.secondaryColor; // dot ring border
  static const Color _thumbColor = AppColors.ratingProgressColor;  // thumb fill (grey)
  static const Color _activeDotBorderColor = AppColors.secondaryColor; // active dot ring

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;

        // Track starts and ends at dot centers (not thumb centers)
        // so dots at position 1 and 10 are fully on screen
        final trackLeft = _dotRadius;
        final trackWidth = totalWidth - _dotRadius * 2;
        final step = trackWidth / (_steps - 1);

        // Thumb center X — aligned to dot center of current value
        final thumbCenterX = trackLeft + (value - 1) * step;

        // Trail width = from track start to thumb center
        final trailWidth = thumbCenterX - trackLeft;

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragUpdate: (details) {
            final localX = details.localPosition.dx.clamp(
              trackLeft,
              trackLeft + trackWidth,
            );
            final rawValue = (localX - trackLeft) / step + 1;
            final snapped = rawValue.round().clamp(1, _steps).toDouble();
            onChanged(snapped);
          },
          onTapDown: (details) {
            final localX = details.localPosition.dx.clamp(
              trackLeft,
              trackLeft + trackWidth,
            );
            final rawValue = (localX - trackLeft) / step + 1;
            final snapped = rawValue.round().clamp(1, _steps).toDouble();
            onChanged(snapped);
          },
          child: SizedBox(
            width: totalWidth,
            height: _dotRadius * 2 + _numberAreaHeight,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                /// ── 1. FULL TRACK (dark background bar)
                Positioned(
                  left: trackLeft,
                  top: _dotRadius - _trackHeight / 2,
                  width: trackWidth,
                  height: _trackHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: _trackColor,
                      borderRadius: BorderRadius.circular(_trackHeight / 2),
                    ),
                  ),
                ),

                /// ── 2. TRAIL (filled from left to thumb — grey)
                if (trailWidth > 0)
                  Positioned(
                    left: trackLeft,
                    top: _dotRadius - _trackHeight / 2,
                    width: trailWidth,
                    height: _trackHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _trailColor,
                        borderRadius: BorderRadius.circular(_trackHeight / 2),
                      ),
                    ),
                  ),

                /// ── 3. DOTS at each step (visible as ring around thumb when active)
                ...List.generate(_steps, (i) {
                  final dotCenterX = trackLeft + i * step;
                  final isActive = (i + 1) == value.round();

                  return Positioned(
                    left: dotCenterX - _dotRadius,
                    top: 0,
                    child: Container(
                      width: _dotRadius * 2,
                      height: _dotRadius * 2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // Active dot: dark fill so thumb color contrasts as inner circle
                        // Inactive dot: dark fill
                        color: _dotColor,
                        border: Border.all(
                          // Active dot ring becomes the visible "frame" around thumb
                          color: isActive ? _activeDotBorderColor : _dotBorderColor,
                          width: isActive ? 2.0 : 1.5,
                        ),
                      ),
                    ),
                  );
                }),

                /// ── 4. THUMB — small filled circle INSIDE the active dot
                ///    Thumb radius < dot radius so the dot ring is always visible
                Positioned(
                  left: thumbCenterX - _thumbRadius,
                  top: _dotRadius - _thumbRadius, // centered vertically within dot
                  child: Container(
                    width: _thumbRadius * 2,
                    height: _thumbRadius * 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _thumbColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ),

                /// ── 5. NUMBER LABELS below dots
                ...List.generate(_steps, (i) {
                  final dotCenterX = trackLeft + i * step;
                  final isActive = (i + 1) == value.round();
                  return Positioned(
                    left: dotCenterX - 8,
                    top: _dotRadius * 2 + 4,
                    child: SizedBox(
                      width: 16,
                      child: Text(
                        "${i + 1}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isActive ? Colors.white : Colors.white54,
                          fontSize: 11,
                          fontWeight: isActive
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}