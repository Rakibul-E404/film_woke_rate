
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_background.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: CustomScrollView(
          slivers: [
            /// SLIVER APP BAR WITH BACKGROUND IMAGE
            SliverAppBar(
              expandedHeight: 320,
              floating: false,
              pinned: false,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 8),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    /// BACKGROUND IMAGE ONLY IN APP BAR
                    Image.asset(
                      'assets/images/movie_poster.png',
                      fit: BoxFit.cover,
                    ),
                    /// DARK OVERLAY
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.7),
                            const Color(0xFF0D1F33),
                          ],
                        ),
                      ),
                    ),
                    /// CONTENT
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),

                            /// Movie Poster and Info Row
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// MOVIE POSTER
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    'assets/images/movie_poster.png',
                                    width: 130,
                                    height: 200,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(
                                      width: 130,
                                      height: 190,
                                      color: const Color(0xFF1E293B),
                                      child: const Icon(
                                        Icons.movie,
                                        color: Colors.white38,
                                        size: 48,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 14),

                                /// Title and Info (right side)
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      /// TITLE
                                      const Text(
                                        'THE OFFICE',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1.5,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black54,
                                              offset: Offset(2, 2),
                                              blurRadius: 4,
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 8),

                                      /// SUBTITLE
                                      const Text(
                                        'TV Series • S1-S9 • 22m',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),

                                      const SizedBox(height: 16),

                                      /// Rating and Watch Trailer Row
                                      Row(
                                        children: [
                                          /// RATING BADGE - CIRCLE
                                          Container(
                                            width: 48,
                                            height: 48,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE05A2B),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white.withOpacity(0.3),
                                                width: 2,
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                '8.5',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),

                                          const SizedBox(width: 12),

                                          /// WATCH TRAILER BUTTON
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 12,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(25),
                                                border: Border.all(
                                                  color: Colors.white.withOpacity(0.3),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.all(4),
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFFE05A2B),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: const Icon(
                                                      Icons.play_arrow,
                                                      color: Colors.white,
                                                      size: 14,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  const Text(
                                                    'Watch Trailer',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 16),

                                      /// ACTION BUTTONS
                                      Row(
                                        children: [
                                          _buildActionButton(CupertinoIcons.checkmark_alt),
                                          const SizedBox(width: 10),
                                          _buildActionButton(Icons.favorite_border),
                                          const SizedBox(width: 10),
                                          _buildActionButton(Icons.bookmark_border),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// CONTENT SLIVER - With CustomBackground showing through
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  /// DECORATIVE STARS LINE
                  _buildStarsDivider(),
                  const SizedBox(height: 28),

                  Padding(
                    padding:  EdgeInsets.only(left: 16,right: 16),
                    child: Column(
                      children: [
                    /// OVERVIEW SECTION
                        _buildOverviewSection(),

                        const SizedBox(height: 28),

                        /// CAST SECTION
                        _buildCastSection(),

                        const SizedBox(height: 28),

                        /// ALL SEASONS SECTION
                        _buildAllSeasonsSection(),

                        const SizedBox(height: 28),

                        /// UMR RATINGS SECTION
                        _buildUmrRatingsSection(),

                        const SizedBox(height: 28),

                        /// USER REVIEW SECTION
                        _buildUserReviewSection(),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 22,
      ),
    );
  }

  /// STARS DIVIDER
  Widget _buildStarsDivider() {
    return Container(
      height: 30,
      decoration: const BoxDecoration(
        color: Color(0xFF8B2635),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          15,
              (index) => const Icon(
            Icons.star,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }

  /// OVERVIEW SECTION
  Widget _buildOverviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Color(0xFFE05A2B),
              size: 24,
            ),
            const SizedBox(width: 10),
            const Text(
              'OVERVIEW',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        const Text(
          'A mockumentary on a group of typical office workers, where the workday consists of ego clashes, inappropriate behavior, tedium and romance. A mockumentary on a group of typical office workers, where the workday consists of ego clashes, inappropriate behavior, tedium and romance.',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  /// CAST SECTION
  Widget _buildCastSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Color(0xFFE05A2B),
              size: 24,
            ),
            const SizedBox(width: 10),
            const Text(
              'CAST',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                width: 110,
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: const Color(0xFF1E293B),
                      backgroundImage: const AssetImage(
                        'assets/images/demo_user.jpg',
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Rainn Wilson',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Dwight Schrute',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 11,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// ALL SEASONS SECTION
  Widget _buildAllSeasonsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Color(0xFFE05A2B),
              size: 24,
            ),
            const SizedBox(width: 10),
            const Text(
              'ALL SEASONS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: 140,
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/movie_poster.png',
                              width: 140,
                              height: 160,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                width: 140,
                                height: 160,
                                color: const Color(0xFF1E293B),
                                child: const Icon(
                                  Icons.movie,
                                  color: Colors.white38,
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE05A2B),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                '8.5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Season 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      '2005 • 6 Episodes',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// UMR RATINGS SECTION
  Widget _buildUmrRatingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Color(0xFFE05A2B),
              size: 24,
            ),
            const SizedBox(width: 10),
            const Text(
              'UMR RATINGS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE05A2B),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Add Your Rating',
                  style: TextStyle(
                    color: Color(0xFFE05A2B),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 20),

        Row(
          children: [
            /// BIG RATING
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '09',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '/10',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: List.generate(
                    5,
                        (index) => const Icon(
                      Icons.star,
                      color: Color(0xFFE05A2B),
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'By 1.9k users',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),

            const SizedBox(width: 24),

            /// RATING BARS
            Expanded(
              child: Column(
                children: List.generate(
                  10,
                      (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          '${10 - index}',
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  // width: MediaQuery.of(context).size.width * 0.35 *
                                  //     (1 - (index * 0.08)),
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: index < 3
                                        ? const Color(0xFFE05A2B)
                                        : Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// USER REVIEW SECTION
  // Widget _buildUserReviewSection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Row(
  //         children: [
  //           const Icon(
  //             Icons.star,
  //             color: Color(0xFFE05A2B),
  //             size: 24,
  //           ),
  //           const SizedBox(width: 10),
  //           const Text(
  //             'USER REVIEW',
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 22,
  //               fontWeight: FontWeight.w900,
  //               letterSpacing: 1.2,
  //             ),
  //           ),
  //         ],
  //       ),
  //
  //       const SizedBox(height: 16),
  //
  //       /// ADD REVIEW BUTTON
  //       Container(
  //         width: double.infinity,
  //         padding: const EdgeInsets.symmetric(vertical: 14),
  //         decoration: BoxDecoration(
  //           color: Colors.white.withOpacity(0.05),
  //           borderRadius: BorderRadius.circular(12),
  //           border: Border.all(
  //             color: Colors.white.withOpacity(0.1),
  //           ),
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             const CircleAvatar(
  //               radius: 16,
  //               backgroundColor: Color(0xFF1E293B),
  //               child: Icon(
  //                 Icons.add,
  //                 color: Colors.white54,
  //                 size: 16,
  //               ),
  //             ),
  //             const SizedBox(width: 10),
  //             Text(
  //               'Add Your Review',
  //               style: TextStyle(
  //                 color: Colors.white.withOpacity(0.6),
  //                 fontSize: 14,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //
  //       const SizedBox(height: 16),
  //
  //       /// REVIEW CARD
  //       Container(
  //         padding: const EdgeInsets.all(16),
  //         decoration: BoxDecoration(
  //           color: const Color(0xFF1E293B),
  //           borderRadius: BorderRadius.circular(12),
  //           border: Border.all(
  //             color: Colors.white.withOpacity(0.1),
  //           ),
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               children: [
  //                 const CircleAvatar(
  //                   radius: 20,
  //                   backgroundImage: AssetImage('assets/images/demo_user.jpg'),
  //                 ),
  //                 const SizedBox(width: 12),
  //                 Expanded(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Row(
  //                         children: [
  //                           const Text(
  //                             'Farhan Hasan',
  //                             style: TextStyle(
  //                               color: Colors.white,
  //                               fontSize: 14,
  //                               fontWeight: FontWeight.w600,
  //                             ),
  //                           ),
  //                           const SizedBox(width: 6),
  //                           Container(
  //                             padding: const EdgeInsets.symmetric(
  //                               horizontal: 6,
  //                               vertical: 2,
  //                             ),
  //                             decoration: BoxDecoration(
  //                               color: const Color(0xFFE05A2B),
  //                               borderRadius: BorderRadius.circular(4),
  //                             ),
  //                             child: const Text(
  //                               'Follow',
  //                               style: TextStyle(
  //                                 color: Colors.white,
  //                                 fontSize: 10,
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       const SizedBox(height: 2),
  //                       const Text(
  //                         'Updated on 23 Nov, 2025',
  //                         style: TextStyle(
  //                           color: Colors.white54,
  //                           fontSize: 11,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //
  //             const SizedBox(height: 12),
  //
  //             const Text(
  //               'Such an incredible show. Probably my favorite show of all time. The humor and office environment is easy to relate to.',
  //               style: TextStyle(
  //                 color: Colors.white70,
  //                 fontSize: 13,
  //                 height: 1.5,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }


  /// USER REVIEW SECTION
  Widget _buildUserReviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Color(0xFFE05A2B),
              size: 28,
            ),
            const SizedBox(width: 10),
            const Text(
              'USER REVIEW',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        /// ADD REVIEW SECTION
        Row(
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/images/demo_user.jpg'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add Your Review',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 1,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        /// REVIEW LIST
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: _buildReviewCard(),
            );
          },
        ),

        /// LOAD MORE BUTTON
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Text(
              'Load More',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/images/demo_user.jpg'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Farhan Hasan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Follow',
                        style: TextStyle(
                          color: Color(0xFFE05A2B),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Updated on 23 Nov, 2025',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          'Such an incredible show. Probably my favorite show of all time. The characters and office environment is easy to relate to.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}