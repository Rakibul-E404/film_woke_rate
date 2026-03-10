import 'package:flutter/material.dart';

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
        const SizedBox(height: 16),

        /// SLIDER
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4,
            activeTrackColor: const Color(0xff0e2a3d),
            inactiveTrackColor: const Color(0xff0e2a3d),
            thumbColor: Colors.grey,
            overlayShape: SliderComponentShape.noOverlay,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
          ),
          child: Slider(
            min: 1,
            max: 10,
            divisions: 9,
            value: value,
            onChanged: onChanged,
          ),
        ),

        /// NUMBERS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            10,
                (index) => Text(
              "${index + 1}",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
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
                backgroundColor: const Color(0xffd83a0f),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
              ),
              onPressed: () {
                print("Movie: $movieRating");
                print("Woke: $wokeRating");
              },
              child: const Text(
                "Done",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// FIRST RATING
          buildRating(
            "RATE THIS MOVIES",
            movieRating,
                (v) => setState(() => movieRating = v),
          ),

          const SizedBox(height: 30),

          /// SECOND RATING
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