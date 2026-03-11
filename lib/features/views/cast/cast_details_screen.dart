import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woke_movie_rating/features/models/movie_model.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';
import 'package:woke_movie_rating/features/widgets/custom_background.dart';
import 'package:woke_movie_rating/features/widgets/details_screen_widget/stars_divider.dart';

class CastDetailsScreen extends StatelessWidget {
  final CastMember castMember;

  const CastDetailsScreen({
    super.key,
    required this.castMember,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 400,
              floating: false,
              pinned: true,
              backgroundColor: Colors.transparent,
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
                    // Background Image
                    Image.asset(
                      castMember.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: const Color(0xFF1E293B),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.white.withOpacity(0.3),
                            size: 100,
                          ),
                        ),
                      ),
                    ),
                    // Dark overlay with gradient
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.5),
                            const Color(0xFF0D1F33),
                          ],
                        ),
                      ),
                    ),
                    // Content at bottom
                    Positioned(
                      bottom: 10,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// short bio
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Name with red underline effect
                              Text(
                                castMember.name.toUpperCase(),
                                style: AppTextStyle.largeHeadingFranchise.copyWith(
                                  height: 1,
                                ),
                              ),
                              const SizedBox(height: 6),

                              // Red accent line
                              Container(
                                width: 60,
                                height: 4,
                                color: AppColors.redColor,
                              ),
                              Text(
                                'BIRTHDAY',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'January 20, 1966 (59 years old)',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'ALSO KNOWN FOR',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Rainan Dietrich Wilson\nRainan Percival Dietrich Wilson',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Content Section
            SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                      StarsDivider(),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [

                        // BIOGRAPHY Section
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/star_with_background_shade.svg",
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 10),
                            Text('BIOGRAPHY', style: AppTextStyle.largeHeadingFranchise),
                          ],
                        ),
                        const SizedBox(height: 16),

                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                          child: Text(
                            'Rainan Dietrich Wilson (born January 20, 1966) is an American actor and comedian. He is primarily known for his role as the egomaniacal Dwight Schrute on the American version of the television comedy The Office. He has also directed two episodes of The Office: the sixth season\'s "The Cover-Up" and the seventh season\'s "Classy Christmas".',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              height: 1.6,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // KNOWN FOR Section
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/star_with_background_shade.svg",
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 10),
                            Text('KNOWN FOR', style: AppTextStyle.largeHeadingFranchise),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Horizontal scroll of movies
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              List<String> movies = ['THE MEG', 'THE OFFICE', 'SUPER', 'THE ROCKER'];
                              return Container(
                                width: 120,
                                margin: const EdgeInsets.only(right: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF1E293B),
                                            borderRadius: BorderRadius.circular(12),
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/movie_poster.png'),
                                              fit: BoxFit.cover,
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
                                    const SizedBox(height: 8),
                                    Text(
                                      movies[index],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 24),

                        // PERSONAL INFORMATION Section
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/star_with_background_shade.svg",
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 10),
                            Text('PERSONAL INFORMATION', style: AppTextStyle.largeHeadingFranchise),
                          ],
                        ),
                        const SizedBox(height: 16),

                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                          child: Column(
                            children: [
                              _buildInfoRow('Known for', 'Acting'),
                              _buildInfoRow('Gender', 'Male'),
                              _buildInfoRow('Birthday', 'January 20, 1966 (59 years old)'),
                              _buildInfoRow('Place of Birthday', 'Seattle, Washington, USA'),
                              _buildInfoRow('Also Known For', 'Rainan Dietrich Wilson\nRainan Percival Dietrich Wilson'),
                              _buildInfoRow('Social Media', ''),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                // height: value.contains('\n') ? 1.4 : 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}