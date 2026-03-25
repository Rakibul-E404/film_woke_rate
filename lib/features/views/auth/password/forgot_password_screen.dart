import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:pinput/pinput.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import 'package:woke_movie_rating/features/utils/app_text_styles.dart';
import 'package:woke_movie_rating/features/views/auth/password/reset_password_screen.dart';

/// The main container for all onboard pages
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // Default pin theme configuration
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  /// Logo at the top
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 60,
                        width: 60,
                      ),
                    ],
                  ),

                  /// Spacer to push content to center
                  const Spacer(),

                  /// Main content column
                  Column(
                    children: [
                      ///heading
                      Text(
                        "Forgot your password?",
                        style: AppTextStyle.largeHeadingFranchise,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),

                      /// sub heading
                      Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: Text(
                          "Enter the email associated with your email address",
                          style: AppTextStyle.smallText.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30),

                      /// text field
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

                      const SizedBox(height: 30),

                      /// elevated button
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
                            /// todo: --- will handel adn update by the API integration
                            Get.to(()=> ResetPasswordScreen());
                          },
                          child: Text(
                            "Get OTP",
                            style: AppTextStyle.defaultTextStyle.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Spacer to push content to center
                  const Spacer(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}