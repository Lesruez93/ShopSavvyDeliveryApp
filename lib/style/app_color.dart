import 'package:flutter/cupertino.dart';

class AppColor {
  static LinearGradient primaryGradient = LinearGradient(
    colors: [primary, Color(0xFF2A388B)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
   static const Color primary = Color(0xFF2A388B);
  // static Color primarySoft = Color(0xFF548DF3);
  static Color primaryExtraSoft = Color(0xFFEFF3FC);
 // static Color secondary = Color(0xFF1B1F24);
  static Color secondarySoft = Color(0xFF9D9D9D);
  static Color secondaryExtraSoft = Color(0xFFE9E9E9);
  static const Color error = Color(0xFFD00E0E);
  static const Color success = Color(0xFF16AE26);
  static const Color successTint = Color(0x9116AE26);

  static const Color warning = Color(0xFFEB8600);
  static const Color warningTint = Color(0xAEEB8600);

  static const Color primaryHard = Color(0xFF266EF1);
  static const Color primarySoft = Color(0xFFEAEAF2);
  static const Color secondary = Color(0xFF0A0E2F);
  static const Color accent = Color(0xFFFABA3E);
  static const Color border = Color(0xFFD3D3E4);
}
