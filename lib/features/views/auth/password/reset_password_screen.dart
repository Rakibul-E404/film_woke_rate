import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';

import 'forgot_password_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState
    extends State<ResetPasswordScreen> {

  bool _obscurePassword = true;

  final TextEditingController _passwordController =
  TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [

            /// 🔹 Logo at Top
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 60,
                    width: 60,
                  ),
                ],
              ),
            ),

            /// 🔹 Centered + Scrollable Content
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Center(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(
                              horizontal: 12),
                          child: Column(
                            mainAxisSize:
                            MainAxisSize.min,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [

                              /// Title
                              Text(
                                "Reset password",
                                style: AppTextStyle
                                    .largeHeadingFranchise,
                              ),
                              const SizedBox(height: 6),

                              Text(
                                "Set your new password",
                                style: AppTextStyle
                                    .smallText
                                    .copyWith(
                                  fontSize: 14,
                                  fontWeight:
                                  FontWeight.w600,
                                ),
                                textAlign:
                                TextAlign.center,
                              ),

                              const SizedBox(height: 30),

                              /// Password Label
                              Align(
                                alignment:
                                Alignment.centerLeft,
                                child: Text(
                                  "Password",
                                  style: AppTextStyle
                                      .smallText
                                      .copyWith(
                                    fontWeight:
                                    FontWeight.w400,
                                    color: AppColors
                                        .whiteColor,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              /// Password Field
                              _buildPasswordField(
                                  _passwordController),

                              const SizedBox(height: 16),

                              /// Confirm Password Label
                              Align(
                                alignment:
                                Alignment.centerLeft,
                                child: Text(
                                  "Confirm Password",
                                  style: AppTextStyle
                                      .smallText
                                      .copyWith(
                                    fontWeight:
                                    FontWeight.w400,
                                    color: AppColors
                                        .whiteColor,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              /// Confirm Password Field
                              _buildPasswordField(
                                  _confirmPasswordController),

                              const SizedBox(height: 30 ),

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
                                    // Get.offAll(()=>ForgotPasswordScreen());
                                  },
                                  child: Text(
                                    "Reset",
                                    style: AppTextStyle.defaultTextStyle.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(
      TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        border:
        Border.all(color: AppColors.whiteColor),
        borderRadius:
        BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: _obscurePassword,
        style: AppTextStyle.defaultTextStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
          const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _obscurePassword =
                  !_obscurePassword;
                });
              },
              child: SvgPicture.asset(
                _obscurePassword
                    ? "assets/icons/eye_close.svg"
                    : "assets/icons/eye_open.svg",
                height: 20,
                width: 20,
                color:
                AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}