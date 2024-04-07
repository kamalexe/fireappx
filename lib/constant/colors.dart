import 'package:flutter/material.dart';

class AppColors {
  Color myDarkBlue = const Color(0xff000033);
  Color mytheam = const Color(0xFFFFE27F);
  Color lightText = const Color.fromRGBO(255, 255, 255, 1);
  Color darkText = const Color.fromRGBO(0, 0, 0, 1);
  Color shadawColor = const Color.fromRGBO(0, 0, 0, 0.08);
  Color appBarBG = Color(0xFF1B60E5);
  Color blackColor05 = Colors.black.withOpacity(0.5);
  Color white = Colors.white;
  Color yellow = Color(0xFFFFC100);

  LinearGradient linearGradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [
        0.1154,
        0.3846,
        0.6076,
        0.7614,
        0.8845
      ],
      colors: [
        Color(0xFFCB983F),
        Color(0xFFFAD562),
        Color(0xFFFAEF9F),
        Color(0xFFD4AF61),
        Color(0xFFCB983F),
      ]);
}
