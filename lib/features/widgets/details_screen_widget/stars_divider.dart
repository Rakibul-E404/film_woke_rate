import 'package:flutter/material.dart';

class StarsDivider extends StatelessWidget {
  const StarsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: const BoxDecoration(color: Color(0xFF8B2635)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          15,
              (index) => const Icon(Icons.star, color: Colors.white, size: 16),
        ),
      ),
    );
  }
}