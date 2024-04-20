import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'details_place.dart';

// Define a class to represent a travel place
class TravelPlace {
  final String name;
  final String address;
  final double rating;
  final String image;
  final VoidCallback onTap;

  TravelPlace({
    required this.name,
    required this.address,
    required this.rating,
    required this.image,
    required this.onTap,
  });
}

// Sample list of travel places
List<TravelPlace> travelPlaces = [
  TravelPlace(
      name: "Elephantine Island".tr,
      address: "Aswan".tr,
      rating: 4.5,
      image: "assets/images/elephantine-island.jpg",
      onTap: () {
        Get.to(DestinationPage);
      }),
  TravelPlace(
      name: "Baron Palace".tr,
      address: "Cairo".tr,
      rating: 4.7,
      image: "assets/images/baron.jpg",
      onTap: () {
        Get.to(DestinationPage);
      }),
  TravelPlace(
      name: "Alexandria Library".tr,
      address: "Alexandria".tr,
      rating: 4.7,
      image: "assets/images/liberary.jpg",
      onTap: () {
        Get.to(DestinationPage);
      }),
  TravelPlace(
      name: "Sewa Lake".tr,
      address: "Marsa Matrouh".tr,
      rating: 4.7,
      image: "assets/images/sewa.jpg",
      onTap: () {
        Get.to(DestinationPage);
      }),
  TravelPlace(
      name: "Saint Catherine".tr,
      address: "South Sinai".tr,
      rating: 4.7,
      image: "assets/images/Catherine.jpg",
      onTap: () {
        Get.to(DestinationPage);
      }),
  TravelPlace(
      name: "Valley of the Kings".tr,
      address: "Luxor".tr,
      rating: 4.7,
      image: "assets/images/Valley of the Kings.jpg",
      onTap: () {
        Get.to(DestinationPage);
      }),
  TravelPlace(
      name: "Prince Mohamed Ali Palace".tr,
      address: "Old Cairo".tr,
      rating: 4.7,
      image: "assets/images/manial-palace.jpg",
      onTap: () {
        Get.to(DestinationPage);
      }),
  TravelPlace(
      name: "Karnak Temple".tr,
      address: "Luxor".tr,
      rating: 4.7,
      image: "assets/images/Karnak.jpg",
      onTap: () {
        Get.to(DestinationPage);
      }),
  TravelPlace(
      name: "Cairo Tower".tr,
      address: "Cairo".tr,
      rating: 4.7,
      image: "assets/images/cairo-tower.jpg",
      onTap: () {
        Get.to(DestinationPage);
      }),
  TravelPlace(
      name: "Amr Ibn al'As mosque".tr,
      address: "Cairo".tr,
      rating: 4.7,
      image: "assets/images/gam3.jpg",
      onTap: () {
        Get.to(DestinationPage);
      }),
  // Add more travel places as needed
];

class TravelPlacesPage extends StatelessWidget {
  const TravelPlacesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: Text('Travel Places'.tr),
      ),
      body: ListView.builder(
        itemCount: travelPlaces.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: GestureDetector(
              onTap: () {
                // Get.to(DestinationPage);
              },
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft:
                                Radius.circular(15.0)), // تحديد شكل الحدود
                        image: DecorationImage(
                          image: AssetImage(travelPlaces[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Name, address, and rating on the right
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15, right: 8, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              travelPlaces[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              travelPlaces[index].address,
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Rating:'.tr,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.deepPurpleAccent,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.deepPurpleAccent,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.deepPurpleAccent,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.deepPurpleAccent,
                                ),
                                Icon(
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
