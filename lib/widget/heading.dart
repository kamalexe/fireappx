import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String text;
  const HeadingText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        text, // Text content
        textAlign: TextAlign.left, // Text alignment to the left
        style: const TextStyle(
          color: Color.fromRGBO( 0, 0, 0, 1), // Text color as RGBA (black in this case)
          fontFamily: 'Roboto', // Font family
          fontSize: 18, // Font size in pixels
          fontWeight: FontWeight
              .w500, // Font weight, 500 is equivalent to FontWeight.w500
          height:
              21.09 / 18, // Line height expressed as a multiplier of font size
        ),
      ),
    );
  }
}
