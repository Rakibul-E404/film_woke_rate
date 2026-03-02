import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';

import '../auth/login/login_screen.dart';
import 'onboard_page1.dart';
import 'onboard_page2.dart';
import 'onboard_page3.dart';
import 'onboard_page4.dart';

/// The main container for all onboard pages
class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // List of all onboard content pages
  final List<Widget> _pages = const [
    OnboardPage1(),
    OnboardPage2(),
    OnboardPage3(),
    OnboardPage4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // Logo/Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Image.asset('assets/images/logo.png', height: 60, width: 60),
                ],
              ),
            ),

            // Expanded scrollable PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _pages[index];
                },
              ),
            ),

            /// Bottom navigation: dots + Continue
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                children: [
                  // Dots in a row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                          (index) => _buildDot(index),
                    ),
                  ),

                  const SizedBox(height: 36), // Space between dots and button

                  /// Continue button (works for all pages)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage < _pages.length - 1) {
                          // Go to next page
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Get.to(() => LoginScreen());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppColors.whiteColor,
                        backgroundColor: AppColors.redColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Continue', //  Always shows "Continue"
                        style: AppTextStyle.defaultTextStyle.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }

  // Build the simple dot for page indicators
  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.red : Colors.grey[400],
        shape: BoxShape.circle,
      ),
    );
  }
}







