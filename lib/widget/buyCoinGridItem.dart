import 'package:fireappx/constant/colors.dart';
import 'package:fireappx/model/dataModel.dart';
import 'package:flutter/material.dart';

class BuyCoinGridItem extends StatelessWidget {
  final Packs pack;
  const BuyCoinGridItem({
    Key? key,
    required this.pack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors().white, // Background color rgba(255, 255, 255, 1)
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors().yellow,
          width: 0.8,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(255, 193, 0, 0.5), // Shadow color
            blurRadius: 6, // Shadow blur radius
            offset: Offset(0, 0), // Shadow position
          ),
        ],
      ),
      child: Column(children: [
        Text(
          '${pack.coins}',
          style: TextStyle(
            color:
                AppColors().darkText, // Text color as RGBA (black in this case)
            fontFamily: 'Roboto', // Font family
            fontSize: 14, // Font size in pixels
            fontWeight: FontWeight
                .w500, // Font weight, 500 is equivalent to FontWeight.w500
          ),
        ),
        Text(
          'Coins',
          style: TextStyle(
            color:
                AppColors().darkText, // Text color as RGBA (black in this case)
            fontFamily: 'Roboto', // Font family
            fontSize: 12, // Font size in pixels
            fontWeight: FontWeight
                .w400, // Font weight, 500 is equivalent to FontWeight.w500
          ),
        ),
        Expanded(child: image()),
        CoindBuyBtn(
          label: "${pack.coins}",
          onPressed: () {},
        )
      ]),
    );
  }

  Widget image() {
    return SizedBox(
        height: 60, width: 60, child: Image.asset('assets/icons/${pack.icon}'));
  }
}

class CoindBuyBtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  CoindBuyBtn({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 4,
              offset: Offset(0, 4), // Shadow position
            ),
          ],
          color: const Color.fromRGBO(199, 28, 28, 1), // Background color
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 11, vertical: 2),
          decoration: BoxDecoration(
              // Text Color

              borderRadius: BorderRadius.circular(6)),
          child: Text("₹$label",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                color: AppColors().white,
                fontWeight: FontWeight.w500,
              )),
        ));
  }
}
