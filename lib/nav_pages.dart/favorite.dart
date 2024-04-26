import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/reuseable_text.dart';
import 'main_wrapper.dart';

class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: Text('Favorite'.tr),
    leading: IconButton(
    icon: Icon(Icons.arrow_back_ios), // You can use any icon here
    onPressed: () {
    Get.to(const MainWrapper());
    // Add your onPressed functionality here
    },
    ),
    ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            size: 200.0,
            color: Colors.deepPurpleAccent,
          ),
          AppText(
            text: "Favorite".tr,
            size: 20,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
      ),
    );
  }
}
