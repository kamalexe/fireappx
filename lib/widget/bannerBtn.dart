import 'package:fireappx/constant/colors.dart';
import 'package:flutter/material.dart';

class BannerBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const BannerBtn({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 15, vertical: 5), // Uniform padding
      decoration: BoxDecoration(
        color: AppColors().myDarkBlue, // Background color
        borderRadius: BorderRadius.circular(8), // Border radius
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding:
              const EdgeInsets.symmetric(horizontal: 20), // Horizontal padding
          // Since TextButton by default takes the minimum size as per the text, setting minimumSize to Size.zero
          minimumSize:
              Size.zero, // Required to respect the Container's width and height
          tapTargetSize: MaterialTapTargetSize
              .shrinkWrap, // To reduce the minimum interactive size
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: AppColors().lightText, // Text color
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 16.41 / 14.0,
          ),
        ),
      ),
    );
  }
}
