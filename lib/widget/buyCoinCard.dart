import 'package:fireappx/constant/colors.dart';
import 'package:fireappx/controller/dataController.dart';
import 'package:fireappx/widget/buyCoinGridItem.dart';
import 'package:fireappx/widget/heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyCoinCard extends StatelessWidget {
  const BuyCoinCard({super.key});

  @override
  Widget build(BuildContext context) {
    final DataController controller = Get.find<DataController>();

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors().white, // Background color
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08), // Shadow color
            offset: Offset(0, 0), // Shadow position
            blurRadius: 16, // Shadow blur radius
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadingText(
            text: 'Buy coins packs',
          ),
          Obx(() {
            if (controller.isLoading.isTrue) {
              return Container();
            }
            if (controller.dataModel?.rewards != null &&
                controller.dataModel!.rewards!.isNotEmpty) {
              return GridView.builder(
                itemCount: controller.dataModel!.packs!
                    .length, // Use the actual count of rewards
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 299 / 320,
                  crossAxisCount:
                      3, // Adjust based on your itemCount to achieve 3 rows
                ),
                itemBuilder: (context, index) {
                  final pack = controller.dataModel!.packs![index];
                  return SizedBox(
                      height: 100,
                      width: 100,
                      child: BuyCoinGridItem(pack: pack));
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              );
            } else {
              return GridView.builder(
                itemCount: controller.shareddataModel!.packs!
                    .length, // Use the actual count of rewards
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 299 / 320,
                  crossAxisCount:
                      3, // Adjust based on your itemCount to achieve 3 rows
                ),
                itemBuilder: (context, index) {
                  final pack = controller.shareddataModel!.packs![index];
                  return SizedBox(
                      height: 100,
                      width: 100,
                      child: BuyCoinGridItem(pack: pack));
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ); // Provide feedback when there are no rewards
            }
          })
        ],
      ),
    );
  }
}
