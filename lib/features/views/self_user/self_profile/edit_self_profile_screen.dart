import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../widgets/custom_background.dart';

class EditSelfProfileScreen extends StatefulWidget {
  const EditSelfProfileScreen({super.key});

  @override
  State<EditSelfProfileScreen> createState() => _EditSelfProfileScreenState();
}

class _EditSelfProfileScreenState extends State<EditSelfProfileScreen> {
  bool _isEditing = false;

  // Controllers for text fields
  final TextEditingController _usernameController = TextEditingController(text: 'Rakibul');
  final TextEditingController _emailController = TextEditingController(text: 'rakib@gmail.com');
  final TextEditingController _phoneController = TextEditingController(text: '+8801629256947');

  // Focus nodes for keyboard handling
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _usernameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  void _toggleEditMode() {
    setState(() {
      if (_isEditing) {
        _saveProfileData();
      }
      _isEditing = !_isEditing;
    });
  }

  void _saveProfileData() {
    print('Username: ${_usernameController.text}');
    print('Email: ${_emailController.text}');
    print('Phone: ${_phoneController.text}');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile updated successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // ... (previous imports and class definition remain the same)

                      // Profile Section with Background Image and Header Overlay
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Background Image Container
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/images/demo_profile_cover.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                            ),
                          ),
                          // Cover Photo Edit Button - Bottom Right Corner
                          if (_isEditing)
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  // TODO: Implement cover photo change
                                  print('Change cover photo');
                                },
                                child: Container(

                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.whiteColor,
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.3),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          // Header Overlay on Cover Photo
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                    onPressed: () => Get.back(),
                                  ),
                                  const SizedBox(width: 25),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/star_with_background_shade.svg",
                                          height: 20,
                                          width: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'VIEW PROFILE',
                                          textAlign: TextAlign.center,
                                          style: AppTextStyle.largeHeadingFranchise?.copyWith(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black.withValues(alpha: 0.5),
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        SvgPicture.asset(
                                          "assets/icons/star_with_background_shade.svg",
                                          height: 20,
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 48),
                                ],
                              ),
                            ),
                          ),
                          // Profile Picture - Positioned to overlap half
                          Positioned(
                            bottom: -60,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 4,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(
                                            alpha: 0.3,
                                          ),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: const CircleAvatar(
                                      radius: 58,
                                      backgroundImage: AssetImage(
                                        'assets/images/demo_user.jpg',
                                      ),
                                    ),
                                  ),
                                  if (_isEditing)
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          // TODO: Implement profile picture change
                                          print('Change profile picture');
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          // Username - Positioned below the profile picture
                          Positioned(
                            bottom: -120,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: _isEditing
                                  ? SizedBox(
                                width: 200,
                                child: TextField(
                                  controller: _usernameController,
                                  focusNode: _usernameFocus,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.smallText?.copyWith(
                                    fontSize: 24,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Username',
                                    hintStyle: TextStyle(
                                      fontSize: 24,
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                                  : Text(
                                _usernameController.text,
                                style: AppTextStyle.smallText.copyWith(
                                  fontSize: 24,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 140),
                      // User Details Card - Updated to match reference design
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Username Field
                            _buildInputField(
                              label: 'Username',
                              controller: _usernameController,
                              focusNode: _usernameFocus,
                              isEditing: _isEditing,
                            ),
                            const SizedBox(height: 20),
                            // Email Field
                            _buildInputField(
                              label: 'Email Address',
                              controller: _emailController,
                              focusNode: _emailFocus,
                              isEditing: _isEditing,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 20),
                            // Phone Field
                            _buildInputField(
                              label: 'Contact Number',
                              controller: _phoneController,
                              focusNode: _phoneFocus,
                              isEditing: _isEditing,
                              keyboardType: TextInputType.phone,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _editOrSaveButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required FocusNode focusNode,
    required bool isEditing,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.smallText.copyWith(
            color: AppColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(0.6),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: isEditing
              ? TextField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            style: AppTextStyle.defaultTextStyle.copyWith(
              color: AppColors.whiteColor,
              fontSize: 16,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              hintStyle: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 16,
              ),
            ),
          )
              : Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Text(
              controller.text,
              style: AppTextStyle.defaultTextStyle.copyWith(
                color: AppColors.whiteColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _editOrSaveButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFFe94560),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFe94560).withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _toggleEditMode,
          borderRadius: BorderRadius.circular(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _isEditing ? 'Save Profile' : 'Edit Profile',
                style: AppTextStyle.defaultTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



