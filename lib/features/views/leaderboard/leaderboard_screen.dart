import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Leaderboard',
                    style: AppTextStyle.largeHeadingFranchise,
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        _buildTimeChip('Week', true),
                        _buildTimeChip('Month', false),
                        _buildTimeChip('All Time', false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Top 3 Users (Podium)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // 2nd Place
                  Expanded(
                    child: _buildPodiumUser(
                      rank: 2,
                      name: 'Sarah J.',
                      rating: '9.2k',
                      avatar: 'assets/images/demo_user.jpg',
                      height: 120,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // 1st Place
                  Expanded(
                    child: _buildPodiumUser(
                      rank: 1,
                      name: 'Alex M.',
                      rating: '12.5k',
                      avatar: 'assets/images/demo_user.jpg',
                      height: 160,
                      isFirst: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // 3rd Place
                  Expanded(
                    child: _buildPodiumUser(
                      rank: 3,
                      name: 'Jamie L.',
                      rating: '7.8k',
                      avatar: 'assets/images/demo_user.jpg',
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Leaderboard List
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF1E293B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return _buildLeaderboardItem(index + 4);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildPodiumUser({
    required int rank,
    required String name,
    required String rating,
    required String avatar,
    required double height,
    bool isFirst = false,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        border: isFirst
            ? Border.all(color: Colors.amber, width: 2)
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: isFirst ? 30 : 24,
            backgroundImage: AssetImage(avatar),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/rate_fill.svg",
                height: 14,
              ),
              const SizedBox(width: 4),
              Text(
                rating,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isFirst ? Colors.amber : Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Text(
              '#$rank',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildLeaderboardItem(int rank) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            '#$rank',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/demo_user.jpg'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'User Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Level 42',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/rate_fill.svg",
                height: 16,
              ),
              const SizedBox(width: 4),
              Text(
                '${(1000 - rank * 50)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}