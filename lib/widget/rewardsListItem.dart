import 'package:fireappx/constant/colors.dart';
import 'package:flutter/material.dart';

class RewardsListItem extends StatelessWidget {
  final String image;
  final String title;
  final String desc;
  final String points;
  const RewardsListItem({
    Key? key,
    required this.image,
    required this.title,
    required this.desc,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320, // width in pixels
      margin: const EdgeInsets.symmetric(
        vertical: 4,
      ), // Padding
      padding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 12), // Padding
      decoration: BoxDecoration(
        color: const Color.fromRGBO(244, 248, 255, 1), // Background color
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(children: [
        Container(
            height: 34,
            width: 34,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Image.asset(image)),
        rewardsTitleNDecs(),
        const Spacer(),
        rewardsPoints()
      ]),
    );
  }

  Widget rewardsTitleNDecs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              color: AppColors()
                  .darkText, // Text color as RGBA (black in this case)
              fontFamily: 'Roboto', // Font family
              fontSize: 16, // Font size in pixels
              fontWeight: FontWeight
                  .w400, // Font weight, 500 is equivalent to FontWeight.w500
            )),
        Text(desc,
            style: TextStyle(
              color: AppColors()
                  .darkText, // Text color as RGBA (black in this case)
              fontFamily: 'Roboto', // Font family
              fontSize: 10, // Font size in pixels
              fontWeight: FontWeight
                  .w400, // Font weight, 500 is equivalent to FontWeight.w500
            ))
      ],
    );
  }

  Widget rewardsPoints() {
    return Row(
      children: [
        Text(
          points,
          style: const TextStyle(
            color: Color.fromRGBO(
                0, 0, 0, 1), // Text color as RGBA (black in this case)
            fontFamily: 'Roboto', // Font family
            fontSize: 16, // Font size in pixels
            fontWeight: FontWeight
                .w500, // Font weight, 500 is equivalent to FontWeight.w500
          ),
        ),
        Container(
            height: 16,
            width: 16,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Image.asset('assets/icons/icon-coin.png'))
      ],
    );
  }
}
