import 'package:fireappx/constant/colors.dart';
import 'package:fireappx/controller/dataController.dart'; // Ensure correct path
import 'package:fireappx/widget/animatedButton.dart';
import 'package:fireappx/widget/bannerBtn.dart'; // Ensure correct path
import 'package:fireappx/widget/gradientProfile.dart'; // Ensure correct path
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerCard extends StatelessWidget {
  BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final DataController controller = Get.find<DataController>();

    return Obx(() {
      if (controller.isLoading.isTrue) {
        return Container();
      }
      if (controller.dataModel?.profile != null) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/icons/bg-gold.png'),
              fit: BoxFit.cover, // Add fit property for better image handling
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          width: 340,
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Update to dynamically display the profile image
                  GradientProfileWidget(
                      image: controller.dataModel!.profile!.photo ?? 'No Name'),
                  // Pass profile data to the nameAndPhone method
                  nameAndPhone(
                      name: controller.dataModel!.profile!.name ?? "Np Name",
                      contact:
                          controller.dataModel!.profile!.phone ?? 'No contact'),
                  BannerBtn(
                    label: 'Edit',
                    onPressed: () {},
                  )
                ],
              ),
              const Spacer(),
              AnimatedButton()
            ],
          ),
        );
      } else {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/icons/bg-gold.png'),
              fit: BoxFit.cover, // Add fit property for better image handling
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          width: 340,
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Update to dynamically display the profile image
                  GradientProfileWidget(
                      image: controller.shareddataModel!.profile!.photo ??
                          'No Name'),
                  // Pass profile data to the nameAndPhone method
                  nameAndPhone(
                      name: controller.shareddataModel!.profile!.name ??
                          "Np Name",
                      contact: controller.shareddataModel!.profile!.phone ??
                          'No contact'),
                  BannerBtn(
                    label: 'Edit',
                    onPressed: () {},
                  )
                ],
              ),
              const Spacer(),
              AnimatedButton()
            ],
          ),
        );
      }
    });
  }

  Widget nameAndPhone({required String name, required String contact}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color: AppColors().myDarkBlue,
            fontFamily: 'Roboto',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          contact,
          style: TextStyle(
            color: AppColors().myDarkBlue,
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
