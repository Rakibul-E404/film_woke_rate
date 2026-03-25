
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../../widgets/custom_background.dart';

class FollowersFollowingScreen extends StatefulWidget {
  final String username;
  final int followersCount;
  final int followingCount;

  const FollowersFollowingScreen({
    super.key,
    this.username = 'Rakibul',
    this.followersCount = 50,
    this.followingCount = 102,
  });

  @override
  State<FollowersFollowingScreen> createState() => _FollowersFollowingScreenState();
}

class _FollowersFollowingScreenState extends State<FollowersFollowingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

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
      body: CustomBackground(
        child: SafeArea(
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
          Expanded(
            child: Text(
              widget.username.toUpperCase(),
              textAlign: TextAlign.center,
              style: AppTextStyle.largeHeadingFranchise,
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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _tabController.animateTo(0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      '${widget.followersCount} Followers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0
                          ? const Color(0xFFe94560)
                          : const Color(0xff05080b),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _tabController.animateTo(1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      '${widget.followingCount} Following',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 1
                          ? const Color(0xFFe94560)
                          : const Color(0xff05080b),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
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
        CustomSearchBarTwo(),
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
        CustomSearchBarTwo(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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

class CustomSearchBarTwo extends StatelessWidget {
  final bool isTappable;
  final bool isEditable;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;

  const CustomSearchBarTwo({
    super.key,
    this.isTappable = true,
    this.isEditable = true,
    this.onTap,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.onSubmitted,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: const Color(0xFF0e1c28),
          borderRadius: BorderRadius.circular(14),
        ),
        child: TextField(
          controller: controller,
          enabled: isEditable,
          style: const TextStyle(color: Colors.white),
          cursorColor: AppColors.whiteColor,
          textInputAction: textInputAction,
          onSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: AppTextStyle.defaultTextStyle.copyWith(
              color: Colors.white.withValues(alpha: 0.7),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white70,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}