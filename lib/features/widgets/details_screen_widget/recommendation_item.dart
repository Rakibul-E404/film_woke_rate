import 'package:flutter/material.dart';

class RecommendationItem extends StatelessWidget {

  final int index;

  const RecommendationItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {

    List<String> movieTitles = [
      'INTERSTELLAR',
      'INCEPTION',
      'THE DARK KNIGHT',
      'TENET',
      'DUNKIRK',
      'OPPENHEIMER',
      'MEMENTO',
      'PRESTIGE',
      'INSOMNIA',
    ];

    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/movie_poster.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            movieTitles[index],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}