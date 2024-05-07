import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel_app/nav_pages.dart/main_wrapper.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        automaticallyImplyLeading: true,
        foregroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), // You can use any icon here
          onPressed: () {
            Get.to(const MainWrapper());
            // Add your onPressed functionality here
          },
        ),
      ),
      // automaticallyImplyLeading: true,
      // foregroundColor: Colors.deepPurpleAccent,
      body: Padding(
        padding: const EdgeInsets.only(top: 50,right: 25,left: 25,bottom: 70),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                color: const Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child:   Padding(
                padding: const EdgeInsets.only(top: 50+16, left: 22,right: 22),
                child: Column(
                  children: [
                     Text(
                      'Thank You!'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                     Text(
                      'Your Transaction Was Successful'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 42,
                    ),
                     PaymentItemInfo(
                      title: 'Date'.tr,
                      value: '8/5/2024'.tr,
                    ),
                    const SizedBox(height: 20,),
                     PaymentItemInfo(
                      title: 'Time'.tr,
                      value: '10:00 AM'.tr,
                    ),
                    const SizedBox(height: 20,),
                     PaymentItemInfo(
                      title: 'To'.tr,
                      value: 'Baron Palace'.tr,
                    ),
                    const Divider(
                      thickness: 2,
                      height: 60,
                    ),
                     TotalPrice(title: 'Total'.tr, value: '20 LE'.tr),
                    const SizedBox(height: 30,),
                    //---Card-info---//
                    Container(
                      width: 305,
                      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 23),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child:   Row(
                        children: [
                          Image(image: AssetImage("assets/images/logo.jpg")),
                          SizedBox(width: 23,),
                          Text.rich(
                              TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Credit Card\n'.tr,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        )
                                    ),
                                    TextSpan(
                                        text: 'MasterCard **85'.tr,
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        )
                                    )
                                  ]
                              )
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(FontAwesomeIcons.barcode,size: 64,),
                        Container(
                          width: 113,
                          height: 58,
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1.50,
                                  color: Colors.deepPurpleAccent,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              )
                          ),
                          child:  Center(
                            child: Text(
                              'PAID'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height:((MediaQuery.sizeOf(context).height*.2-20)/2)-29,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height*.2+20,
              left: 32,
              right: 32,
              child: Row(
                children: List.generate(30, (index) =>
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2) ,
                        child: Container(
                          color: const Color(0xFFB8B8B8),
                          height: 2,
                        ),
                      ),
                    )),
              ),
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height*.2,
              left: -20,
              child:const CircleAvatar(
                backgroundColor: Colors.white,
              ),),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height*.2,
              right: -20,
              child:const CircleAvatar(
                backgroundColor: Colors.white,
              ),),
            const Positioned(
              left: 0,
              right: 0,
              top: -50,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFFD9D9D9),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.deepPurpleAccent,
                  child: Icon(Icons.check,color: Colors.white,size: 50,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//------------------------paymentInfo--------------------//
class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});
  final String title,value;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ],
    );
  }
}
//-----------------Total Price------------------//
class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.title, required this.value});
  final String title,value;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style:  const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w800,
            height: 0,
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style:  const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w800,
            height: 0,
          ),
        ),
      ],
    );
  }
}


