import 'package:flutter/material.dart';
import 'package:woke_movie_rating/features/views/home/popular_movies_section.dart';
import 'package:woke_movie_rating/features/views/home/spotlight_section.dart';
import 'package:woke_movie_rating/features/views/home/top_10_wmr_section.dart';
import '../../widgets/home_widget/custom_search_bar.dart';
import 'ad_banner_section.dart';
import 'hero_section.dart';
import 'home_app_bar.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _dialogTimer;
  bool _isDialogOpen = false;

  @override
  void initState() {
    super.initState();
    // Show dialog when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_isDialogOpen) {
        _showOperaGXDialog();
      }
    });
    // Start periodic timer for every 3 minutes
    _startDialogTimer();
  }

  @override
  void dispose() {
    _dialogTimer?.cancel();
    _dialogTimer = null;
    super.dispose();
  }

  void _startDialogTimer() {
    _dialogTimer?.cancel();
    _dialogTimer = Timer.periodic(const Duration(minutes: 3), (timer) {
    // _dialogTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (mounted && !_isDialogOpen) {
        _showOperaGXDialog();
      }
    });
  }

  void _showOperaGXDialog() {
    if (_isDialogOpen) return;

    _isDialogOpen = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            _isDialogOpen = false;
            return true;
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image container
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Image.asset(
                      "assets/images/opera_gx_image.png",
                      height: 200 /*,width: 40,*/,
                    ),
                  ),

                  /// Buttons
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [

                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  _isDialogOpen = false;
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  side: BorderSide(
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text('Close'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  _isDialogOpen = false;
                                  Navigator.of(context).pop();
                                  // Add your continue logic here
                                  print('Continue button pressed');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE50914),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text('Continue'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).then((_) {
      _isDialogOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/noise_background_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        /// 🔥 APP BAR
        appBar: const HomeAppBar(),

        /// 🔥 BODY
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔥 Ad Banner
                AdBannerSection(),

                SizedBox(height: 18),

                /// 🔎 Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomSearchBar(),
                ),

                SizedBox(height: 20),

                /// 🎬 Hero Section
                HeroSection(),

                SizedBox(height: 20),

                /// ⭐ Popular Movies
                PopularMoviesSection(),

                SizedBox(height: 30),

                /// ⭐ TOP 10 WMR LIST
                Top10WmrSection(),

                SizedBox(height: 20),

                /// ✨ In the Spotlight
                SpotlightSection(),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
