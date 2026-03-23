// ─────────────────────────────────────────────────────────────────────────────
//  lib/screens/user_profile/tabs/watchlist_tab.dart
// ─────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';

import '../../../../models/movie_item.dart';
// import '../../../models/movie_item.dart';
import '../../../widgets/self_user_screen_widget/self_movie_list_card.dart';
// import '../widgets/self_movie_list_card.dart';

class SelfWatchlistTabContent extends StatelessWidget {
  const SelfWatchlistTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 8),
      itemCount: demoMovies.length,
      itemBuilder: (context, index) {
        return MovieListCard(
          movie: demoMovies[index],
          actions: [
            circleBtn(
              icon: Icons.close,
              iconColor: Colors.redAccent,
              onTap: () {},
            ),
            circleBtn(
              icon: Icons.check,
              iconColor: Colors.greenAccent,
              onTap: () {},
            ),
            circleBtn(
              icon: Icons.favorite_border,
              iconColor: Colors.pinkAccent,
              onTap: () {},
            ),
          ],
        );
      },
    );
  }
}