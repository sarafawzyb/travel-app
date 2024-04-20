import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/pages/Payment/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title:  Text(
          "Payment Details".tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      ),
      body: const PaymentDetailsViewBody(),
    );
  }
}
