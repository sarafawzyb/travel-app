import 'package:get/get.dart';

class Category {
  final String name;
  final String image;
  

  Category({required this.name, required this.image,});
}

List<Category> categoryComponents = [
  Category(name: "Beach".tr, image: "assets/images/beach.png"),
  Category(name: "Boat".tr, image: "assets/images/boat.png"),
  Category(name: "Museum".tr, image: "assets/images/museum.png"),
  Category(name: "Lake".tr, image: "assets/images/lake.png"),
  Category(name: "Tricycle".tr, image: "assets/images/tricycle.png"),
 
];
