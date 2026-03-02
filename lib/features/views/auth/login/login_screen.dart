import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';
import 'package:woke_movie_rating/features/views/bottom_navigation/main_bottom_nav.dart';
import 'package:woke_movie_rating/features/views/home/home_screen.dart';

import '../signup/signup_screen.dart';

/// The main container for all onboard pages
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;
  bool _obscurePassword = true; // Add this for password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: SingleChildScrollView(
            // Added to prevent overflow
            child: Column(
              children: [
                /// Logo/Header
                Row(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),

                Text(
                  "Welcome Back!",
                  style: AppTextStyle.largeHeadingFranchise,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: Text(
                    "Let’s get you back to find the best movies that match your style and values!",
                    style: AppTextStyle.smallText.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 30),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Email Address",
                          style: AppTextStyle.smallText.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.whiteColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        style: AppTextStyle.defaultTextStyle,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: AppTextStyle.smallText.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.whiteColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        obscureText: _obscurePassword,
                        style: AppTextStyle.defaultTextStyle,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              child: SvgPicture.asset(
                                _obscurePassword
                                    ? "assets/icons/eye_close.svg" // Add this SVG to your assets
                                    : "assets/icons/eye_open.svg",
                                // Add this SVG to your assets
                                height: 20,
                                width: 20,
                                color: AppColors
                                    .whiteColor, // Optional: tint the SVG
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                /// checkBox
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                      fillColor: WidgetStateProperty.all(
                        AppColors.transparentColor,
                      ),
                      // Always transparent
                      side: WidgetStateBorderSide.resolveWith((
                        Set<WidgetState> states,
                      ) {
                        // Border always visible with same color
                        return BorderSide(
                          color: AppColors.whiteColor,
                          width: 2,
                        );
                      }),
                      checkColor: AppColors.whiteColor, // White check mark
                    ),
                    Text(
                      "Remember Me",
                      style: AppTextStyle.defaultTextStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: AppTextStyle.defaultTextStyle.copyWith(
                          fontSize: 15,
                          color: AppColors.redColor,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.redColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Get.offAll(() => MainBottomNav());
                    },
                    child: Text(
                      "Login",
                      style: AppTextStyle.defaultTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                /// Or divider
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(color: AppColors.greyColor)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Or",
                        style: AppTextStyle.smallText.copyWith(
                          fontSize: 16,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.greyColor)),
                  ],
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      // Wrap with Expanded for better spacing
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Google sign-in logic
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/google.svg",
                          height: 18,
                          width: 18,
                        ),
                        label: Text(
                          'Google',
                          style: AppTextStyle.smallText.copyWith(fontSize: 13),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.transparentColor,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Add spacing between buttons
                    Expanded(
                      // Wrap with Expanded for better spacing
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Facebook sign-in logic
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/facebook.svg",
                          height: 18,
                          width: 18,
                        ),
                        label: Text(
                          'Facebook',
                          style: AppTextStyle.smallText.copyWith(fontSize: 13),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.transparentColor,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: AppTextStyle.smallText.copyWith(fontSize: 14),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: AppTextStyle.smallText.copyWith(
                          color: AppColors.redColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => SignUpScreen());
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20), // Add bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }
}
