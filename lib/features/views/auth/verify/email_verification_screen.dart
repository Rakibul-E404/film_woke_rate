import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';
import 'package:woke_movie_rating/features/views/auth/password/forgot_password_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends State<EmailVerificationScreen> {

  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();

  @override
  void dispose() {
    _pinController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: AppTextStyle.defaultTextStyle.copyWith(
        fontSize: 24,
        color: AppColors.whiteColor,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.whiteColor),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [

            /// 🔹 Centered Full Screen Content
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    /// Heading
                    Text(
                      "Verify Your Email Address",
                      style: AppTextStyle.largeHeadingFranchise,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),

                    /// Subheading
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "Please enter your verification code below to verify your email address",
                        style: AppTextStyle.smallText.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),

                    /// Pinput
                    Pinput(
                      controller: _pinController,
                      focusNode: _pinFocusNode,
                      length: 6,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(
                            color: AppColors.redColor,
                            width: 2,
                          ),
                        ),
                      ),
                      onCompleted: (pin) {
                        debugPrint('Completed PIN: $pin');
                      },
                    ),
                    const SizedBox(height: 30),

                    /// Verify Button
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
                          Get.offAll(()=>ForgotPasswordScreen());
                        },
                        child: Text(
                          "Verify",
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

            /// 🔹 Logo fixed at top-left
            Positioned(
              top: 0,
              left: 12,
              child: Image.asset(
                'assets/images/logo.png',
                height: 60,
                width: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}