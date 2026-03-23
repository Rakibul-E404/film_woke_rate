// ─────────────────────────────────────────────────────────────────────────────
//  lib/screens/user_profile/widgets/self_rating_bar_chart.dart
// ─────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';

class RatingBarChart extends StatelessWidget {
  /// 10 integer values representing counts for ratings 1–10.
  final List<int> data;

  const RatingBarChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final maxVal = data.reduce((a, b) => a > b ? a : b).toDouble();

    return SizedBox(
      height: 48,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(data.length, (i) {
          final frac = maxVal > 0 ? data[i] / maxVal : 0.0;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: (frac * 36).clamp(3.0, 36.0),
                    decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${i + 1}',
                    style: TextStyle(fontSize: 7, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}