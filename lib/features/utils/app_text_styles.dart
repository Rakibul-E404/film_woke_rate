import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  /// Default Text Style with font family --- Lora
  static TextStyle get defaultTextStyle => const TextStyle(
    fontFamily: 'Lora-Regular',  
    fontSize: 16,           // Default font size
    fontWeight: FontWeight.normal,  // Default font weight
    color: Colors.white,    // Default text color
  );

  /// Large Heading
  static TextStyle get largeHeading => const TextStyle(
    fontFamily: 'Lora-Regular',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );



  /// Small Heading
  static TextStyle get smallHeading => const TextStyle(
    fontFamily: 'Lora-Regular',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  /// Small Text
  static TextStyle get smallText => const TextStyle(
    fontFamily: 'Lora-Regular',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );



  /// Default Text Style with font family --- Franchise

  static TextStyle get largeHeadingFranchise => const TextStyle(
    fontFamily: 'Franchise',
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
}