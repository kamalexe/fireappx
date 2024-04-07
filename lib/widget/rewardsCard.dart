import 'package:fireappx/constant/colors.dart';
import 'package:fireappx/model/dataModel.dart';
import 'package:fireappx/widget/heading.dart';
import 'package:fireappx/widget/rewardsListItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/dataController.dart';

class RewardsCard extends StatelessWidget {
  RewardsCard({super.key});
  final DataController controller = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors().white, 
            boxShadow: [
              BoxShadow(
                color: AppColors().shadawColor,
                offset: const Offset(0, 0), // Shadow position
                blurRadius: 16, // Shadow blur radius
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: const HeadingText(
                  text: 'Daily rewards',
                ),
              ),
              Obx(() {
                if (controller.isLoading.isTrue) {
                  return Container();
                }
                if (controller.dataModel?.rewards != null &&
                    controller.dataModel!.rewards!.isNotEmpty) {
                  return ListView.builder(
                    itemCount: controller.dataModel!.rewards!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RewardsListItem(
                        image:
                            'assets/icons/${controller.dataModel!.rewards![index].icon}',
                        title: "${controller.dataModel!.rewards![index].title}",
                        desc:
                            "${controller.dataModel!.rewards![index].summary}",
                        points:
                            "+${controller.dataModel!.rewards![index].coins}",
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.shareddataModel!.rewards!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RewardsListItem(
                        image:
                            'assets/icons/${controller.shareddataModel!.rewards![index].icon}',
                        title:
                            "${controller.shareddataModel!.rewards![index].title}",
                        desc:
                            "${controller.shareddataModel!.rewards![index].summary}",
                        points:
                            "+${controller.shareddataModel!.rewards![index].coins}",
                      );
                    },
                  ); // Provide feedback when there are no rewards
                }
              }),
            ],
          ),
        ),
      ],
    );
  }
}
