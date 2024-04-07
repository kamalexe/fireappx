import 'package:fireappx/constant/colors.dart';
import 'package:flutter/material.dart';

class GradientProfileWidget extends StatelessWidget {
  final String image;
  const GradientProfileWidget({Key? key, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Container with a solid background color and custom border
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 80, // width in pixels
          height: 80, // height in pixels

          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: AppColors().linearGradient),
          ),
        ),
        SizedBox(
          width: 70, // width in pixels
          height: 70, // height in pixels

          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(image)),
                gradient: AppColors().linearGradient),
          ),
        ),
        const Positioned(
            bottom: 0,
            child: GradientBadge(
              text: "Gold",
            ))
      ],
    );
  }
}

class GradientBadge extends StatelessWidget {
  final String text;

  const GradientBadge({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 2), // Adjust padding
      decoration: BoxDecoration(
        gradient: AppColors().linearGradient,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: AppColors().myDarkBlue, // Assuming white text for contrast
          fontSize: 14, // Example font size
        ),
      ),
    );
  }
}
