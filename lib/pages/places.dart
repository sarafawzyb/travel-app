import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/nav_pages.dart/main_wrapper.dart';
import 'package:travel_app/pages/saint_catherine.dart';
import 'package:travel_app/pages/sewa_lake.dart';
import 'alexandria_library.dart';
import 'baron_page.dart';
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
        Get.to(const DestinationPage());
      }),
  TravelPlace(
      name: "Baron Palace".tr,
      address: "Cairo".tr,
      rating: 4.7,
      image: "assets/images/baron.jpg",
      onTap: () {
       Get.to(DestinationPage1());
      }),
  TravelPlace(
      name: "Alexandria Library".tr,
      address: "Alexandria".tr,
      rating: 4.7,
      image: "assets/images/liberary.jpg",
      onTap: () {
       Get.to(DestinationPage2());
      }),
  TravelPlace(
      name: "Sewa Lake".tr,
      address: "Marsa Matrouh".tr,
      rating: 4.7,
      image: "assets/images/sewa.jpg",
      onTap: () {
       Get.to(DestinationPage3());
      }),
  TravelPlace(
      name: "Saint Catherine".tr,
      address: "South Sinai".tr,
      rating: 4.7,
      image: "assets/images/Catherine.jpg",
      onTap: () {
       Get.to(DestinationPage4());
      }),
  TravelPlace(
      name: "Valley of the Kings".tr,
      address: "Luxor".tr,
      rating: 4.7,
      image: "assets/images/Valley of the Kings.jpg",
      onTap: () {
      //  Get.to(DestinationPage());
      }),
  TravelPlace(
      name: "Prince Mohamed Ali Palace".tr,
      address: "Old Cairo".tr,
      rating: 4.7,
      image: "assets/images/manial-palace.jpg",
      onTap: () {
      //  Get.to(DestinationPage());
      }),
  TravelPlace(
      name: "Karnak Temple".tr,
      address: "Luxor".tr,
      rating: 4.7,
      image: "assets/images/Karnak.jpg",
      onTap: () {
      //  Get.to(DestinationPage());
      }),
  TravelPlace(
      name: "Cairo Tower".tr,
      address: "Cairo".tr,
      rating: 4.7,
      image: "assets/images/cairo-tower.jpg",
      onTap: () {
       // Get.to(DestinationPage());
      }),
  TravelPlace(
      name: "Amr Ibn al'As mosque".tr,
      address: "Cairo".tr,
      rating: 4.7,
      image: "assets/images/gam3.jpg",
      onTap: () {
      //  Get.to(DestinationPage());
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), // You can use any icon here
          onPressed: () {
            Get.to(const MainWrapper());
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
