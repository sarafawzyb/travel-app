import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/widget/done.dart';

import '../thank_you_view_body.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const ThankYouViewBody());
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          color: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child:  Center(
          child: Text(
            "Pay".tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
