// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:woke_movie_rating/features/views/auth/login/login_screen.dart';
import 'package:woke_movie_rating/features/views/auth/signup/signup_screen.dart';
import 'package:woke_movie_rating/features/views/auth/verify/email_verification_screen.dart';
import 'package:woke_movie_rating/features/views/bottom_navigation/main_bottom_nav.dart';
import 'package:woke_movie_rating/features/views/details/movie_details_screen.dart';
import 'package:woke_movie_rating/features/views/home/home_screen.dart';
import 'features/views/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Splash Screen Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: const SplashScreen(),
      home: const MainBottomNav(),
      debugShowCheckedModeBanner: false,
    );
  }
}




