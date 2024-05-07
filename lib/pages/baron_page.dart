import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'Payment/payment_details.dart';

class DestinationPage1 extends StatefulWidget {
  const DestinationPage1 ({Key? key}) : super(key: key);

  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage1> {
  int _selectedNumberOfPeople = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepPurpleAccent,
        title:  Text(
          'Baron Palace'.tr,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () async{
              const url = "https://maps.app.goo.gl/EwTofALcabdYKuFq7";
              await launchUrlString(url);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/baron.jpg',
                    fit: BoxFit.cover,
                    width: 500,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          'Baron Palace'.tr,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cairo'.tr,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey[600],
                              ),
                            ),
                             Text(
                              '20 LE'.tr,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.deepPurpleAccent,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.deepPurpleAccent,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.deepPurpleAccent,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.deepPurpleAccent,
                            ),
                            const Icon(
                              Icons.star_border,
                              color: Colors.deepPurpleAccent,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              '(4.0)',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                         Text(
                          "People".tr,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         Text("Number of people in your group".tr,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              final numberOfPeople = index + 1;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedNumberOfPeople = numberOfPeople;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: numberOfPeople ==
                                        _selectedNumberOfPeople
                                        ? Colors.deepPurpleAccent
                                        : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '$numberOfPeople',
                                    style: TextStyle(
                                      color: numberOfPeople ==
                                          _selectedNumberOfPeople
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16.0),
                         Text(
                          "Description".tr,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'The Baron Palace, also known as Le Palais Hindou, is a distinctive and historic mansion in Heliopolis, a suburb northeast of central Cairo, Egypt. It was built in 1905 for Édouard Empain, Baron Empain, a Belgian businessman and industrialist with particular interests in tramways.'.tr,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    // Add favorite functionality
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(PaymentDetailsView());
                    // Add booking functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    minimumSize: const Size(200, 50),
                  ),
                  child:  Text(
                    'Book Trip Now'.tr,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
