import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/lettering-lettering-sticker-puffy-multicolor-stay-tuned-text.gif",
              height: 250,
              width: 600,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "𝘾𝙤𝙢𝙞𝙣𝙜 𝙎𝙤𝙤𝙣".tr,
              style:
                  TextStyle(fontSize: 16, color: Colors.black45),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: EdgeInsets.only(right: 120, left: 120) // foreground
                  ),
              onPressed: () {
                Get.back();
              },
              child: Text(
                '𝘿𝙤𝙣𝙚'.tr,
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
