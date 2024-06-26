import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/nav_pages.dart/main_wrapper.dart';




// Define a class to represent a travel place
class BoatPlaces {
  final String name;
  final String address;
  final double rating;
  final String image;
  final VoidCallback onTap;

  BoatPlaces({
    required this.name,
    required this.address,
    required this.rating,
    required this.image,
    required this.onTap,
  });
}

// Sample list of travel places
List<BoatPlaces> travelPlaces = [
  BoatPlaces(
      name: "Anakob".tr,
      address: "Aswan".tr,
      rating: 4.7,
      image: "assets/images/download.jpg",
      onTap: () {
        // Get.to(DestinationPage3());
      }),
  BoatPlaces(
      name: "River Boat".tr,
      address: "Cairo".tr,
      rating: 4.7,
      image: "assets/images/boat.jpg",
      onTap: () {
        //  Get.to(DestinationPage());
      }),
  BoatPlaces(
      name: "Four Seasons Boat ".tr,
      address: "Cairo".tr,
      rating: 4.7,
      image: "assets/images/download (1).jpg",
      onTap: () {
        //  Get.to(DestinationPage());
      }),
  // Add more travel places as needed
];

class BoatPlacesPage extends StatelessWidget {
  const BoatPlacesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: Text('Boat Places'.tr),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), // You can use any icon here
          onPressed: () {
            Get.to(MainWrapper());
            // Add your onPressed functionality here
          },
        ),
      ),
      body: ListView.builder(
        itemCount: travelPlaces.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: GestureDetector(
              onTap: travelPlaces[index].onTap,
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0)),
                        image: DecorationImage(
                          image: AssetImage(travelPlaces[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Name, address, and rating on the right
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, right: 8, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              travelPlaces[index].name,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              travelPlaces[index].address,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Rating:'.tr,
                                  style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.deepPurpleAccent,
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.deepPurpleAccent,
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.deepPurpleAccent,
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.deepPurpleAccent,
                                ),
                                const Icon(
                                  Icons.star_half,
                                  size: 18,
                                  color: Colors.deepPurpleAccent,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
