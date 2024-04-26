import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Category {
  final String name;
  final String image;
  final VoidCallback onTap;

  Category({
    required this.name,
    required this.image,
    required this.onTap,
  });
}

List<Category> categoryComponents = [
  Category(
      name: "Beach".tr,
      image: "assets/images/beach.png",
      onTap: () {
        // Get.to(DestinationPage3());
      }),
  Category(
      name: "Boat".tr,
      image: "assets/images/boat.png",
      onTap: () {
        // Get.to(DestinationPage3());
      }),
  Category(
      name: "Museum".tr,
      image: "assets/images/museum.png",
      onTap: () {
          // Get.to(TricyclePlaces());
        }),
  Category(
      name: "Lake".tr,
      image: "assets/images/lake.png",
      onTap: () {
        // Get.to(LakePlaces());
      }),
  Category(
      name: "Tricycle".tr,
      image: "assets/images/tricycle.png",
      onTap: () {
        // Get.to(TricyclePlaces());
      }),
];
