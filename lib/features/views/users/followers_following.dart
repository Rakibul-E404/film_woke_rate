// File: lib/features/views/followers_following/followers_following_screen.dart

import 'package:flutter/material.dart';

class FollowersFollowingScreen extends StatefulWidget {
  final String username;
  final int followersCount;
  final int followingCount;

  const FollowersFollowingScreen({
    super.key,
    this.username = 'Tasmiashabu',
    this.followersCount = 50,
    this.followingCount = 102,
  });

  @override
  State<FollowersFollowingScreen> createState() => _FollowersFollowingScreenState();
}

class _FollowersFollowingScreenState extends State<FollowersFollowingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0; // 0 for Followers, 1 for Following

  // Sample data - Replace with your actual data source
  final List<Map<String, dynamic>> _followers = [
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': false, 'followsYou': true},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': true, 'followsYou': true},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': true, 'followsYou': true},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': false, 'followsYou': true},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': true, 'followsYou': true},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': true, 'followsYou': true},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': true, 'followsYou': true},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': true, 'followsYou': true},
  ];

  final List<Map<String, dynamic>> _following = [
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': true, 'followsYou': false},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': true, 'followsYou': true},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': true, 'followsYou': false},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': true, 'followsYou': true},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': true, 'followsYou': false},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': true, 'followsYou': false},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': true, 'followsYou': true},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': true, 'followsYou': false},
  ];

  final List<Map<String, dynamic>> _suggestions = [
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': false},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': false},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': false},
    {'name': 'Miranda baju', 'username': '@miris', 'isFollowing': false},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleFollow(int index, bool isFollowersTab) {
    setState(() {
      if (isFollowersTab) {
        _followers[index]['isFollowing'] = !_followers[index]['isFollowing'];
      } else {
        // For following tab, you might want to unfollow
        // _following[index]['isFollowing'] = !_following[index]['isFollowing'];
      }
    });
  }

  void _followSuggestion(int index) {
    setState(() {
      _suggestions[index]['isFollowing'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a2a3a),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildFollowersTab(),
                  _buildFollowingTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          const Expanded(
            child: Text(
              'TASMIASHABU',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2a3a4a),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _tabController.animateTo(0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: _selectedIndex == 0
                      ? const Color(0xFFe94560)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${widget.followersCount} Followers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _selectedIndex == 0 ? Colors.white : Colors.grey[400],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _tabController.animateTo(1),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: _selectedIndex == 1
                      ? const Color(0xFFe94560)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${widget.followingCount} Following',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _selectedIndex == 1 ? Colors.white : Colors.grey[400],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowersTab() {
    return Column(
      children: [
        _buildSearchBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'All Following',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ...List.generate(
                  _followers.length,
                      (index) => _buildUserTile(
                    name: _followers[index]['name'],
                    username: _followers[index]['username'],
                    isFollowing: _followers[index]['isFollowing'],
                    followsYou: _followers[index]['followsYou'],
                    onTap: () => _toggleFollow(index, true),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFollowingTab() {
    return Column(
      children: [
        _buildSearchBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Suggestions Section
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Suggestions',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ...List.generate(
                  _suggestions.length,
                      (index) => _buildUserTile(
                    name: _suggestions[index]['name'],
                    username: _suggestions[index]['username'],
                    isFollowing: _suggestions[index]['isFollowing'],
                    followsYou: false,
                    isSuggestion: true,
                    onTap: () => _followSuggestion(index),
                  ),
                ),

                // All Followers Section
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                  child: Text(
                    'All Followers',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ...List.generate(
                  _following.length,
                      (index) => _buildUserTile(
                    name: _following[index]['name'],
                    username: _following[index]['username'],
                    isFollowing: _following[index]['isFollowing'],
                    followsYou: _following[index]['followsYou'],
                    onTap: () => _toggleFollow(index, false),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2a3a4a),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey[400]),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTile({
    required String name,
    required String username,
    required bool isFollowing,
    required bool followsYou,
    required VoidCallback onTap,
    bool isSuggestion = false,
  }) {
    String buttonText;
    Color buttonColor;

    if (isSuggestion) {
      buttonText = 'Follow';
      buttonColor = const Color(0xFFe94560);
    } else if (followsYou && !isFollowing) {
      buttonText = 'Follow Back';
      buttonColor = const Color(0xFFe94560);
    } else if (isFollowing) {
      buttonText = 'Unfollow';
      buttonColor = Colors.grey[600]!;
    } else {
      buttonText = 'Follow';
      buttonColor = const Color(0xFFe94560);
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF2a3a4a),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: const AssetImage('assets/images/demo_user.jpg'),
            backgroundColor: Colors.grey[700],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  username,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 0,
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}