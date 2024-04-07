import 'package:fireappx/constant/colors.dart';
import 'package:fireappx/controller/dataController.dart';
import 'package:fireappx/widget/bannerCard.dart';
import 'package:fireappx/widget/buyCoinCard.dart';
import 'package:fireappx/widget/rewardsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataController controller = Get.find<DataController>();
  final textStyle = TextStyle(
    color: AppColors().darkText,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  @override
  Widget build(BuildContext context) {
    Widget appBarBtn() {
      return Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors().lightText,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 4),
              height: 16,
              width: 16,
              child: Image.asset('assets/icons/icon-coin.png'),
            ),
            if (controller.dataModel?.rewards != null &&
                controller.dataModel!.rewards!.isNotEmpty)
              Text(
                '${controller.dataModel?.profile?.coins.toString()}',
                style: textStyle,
              )
            else
              // Display some alternative content or leave it empty based on your design
              Text("${controller.shareddataModel?.profile?.coins.toString()}",
                  style: textStyle),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors().appBarBG,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Obx(() {
            if (controller.isLoading.isTrue) {
              return Container(
                color: AppColors().blackColor05, // Optional: dark overlay
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: 56,
                        decoration: BoxDecoration(color: AppColors().appBarBG),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'FireAppX',
                                style: TextStyle(
                                  color: AppColors().lightText,
                                  fontFamily: 'Roboto',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              appBarBtn()
                            ],
                          ),
                        )),
                    BannerCard(),
                    RewardsCard(),
                    const BuyCoinCard(),
                    if (controller.dataModel == null)
                      Center(
                        child: ElevatedButton(
                          onPressed: () => controller.fetchData(),
                          child: Text('No data found. Tap to refresh.'),
                        ),
                      ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
