/**
// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import '../onboard/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Create color animation from dark to normal
    _colorAnimation = ColorTween(
      begin: Colors.black.withOpacity(0.8), // Dark start
      end: Colors.white, // Normal end
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _animationController.forward();

    // Navigate to onboard screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>  OnboardScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: _colorAnimation.value,
            ),
            child: Center(
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.5, end: 1.0),
                duration: const Duration(seconds: 2),
                curve: Curves.easeOutBack,
                builder: (context, double scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },
                child: Image.asset(
                  'assets/images/splash_image.gif',
                  width: 200,
                  height: 500,
                  fit: BoxFit.contain, // Added BoxFit for better GIF rendering
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}*/




///
///
/// todo:: upper is ok but now as hte gif is for full screen so updating as---->
///
///


// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:woke_movie_rating/features/utils/app_colors.dart';
import '../onboard/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>  OnboardScreen(),
          ),
        );
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          // color: _colorAnimation.value,
        ),
        child: Center(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.5, end: 1.0),
            duration: const Duration(seconds: 2),
            curve: Curves.easeOutBack,
            builder: (context, double scale, child) {
              return Transform.scale(
                scale: scale,
                child: child,
              );
            },
            child: Image.asset(
              'assets/gifs/splash.gif',
              width: double.infinity, // Changed to full width
              height: double.infinity, // Changed to full height
              fit: BoxFit.cover, // Changed to cover to fill the screen
            ),
          ),
        ),
      ),
    );
  }
}