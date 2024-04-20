import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../nav_pages.dart/main_wrapper.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/kit-contactless-payments-with-smartphone-and-pos-terminal.gif",
              height: 250,
              width: 600,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "𝙋𝙖𝙮𝙢𝙚𝙣𝙩 𝙝𝙖𝙨 𝙗𝙚𝙚𝙣 𝙘𝙤𝙣𝙛𝙞𝙧𝙢𝙚𝙙 𝙨𝙪𝙘𝙘𝙚𝙨𝙨𝙛𝙪𝙡𝙡𝙮".tr,
              style: TextStyle(fontSize: 16, color: Colors.black45),
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
                Get.to(MainWrapper());
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
