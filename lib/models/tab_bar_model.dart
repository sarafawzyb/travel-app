import 'package:get/get.dart';

class TabBarModel {
  final String title;
  final String location;
  final String image;
  final int price;

  TabBarModel(
      {required this.title,
      required this.location,
      required this.image,
      required this.price});
}

List<TabBarModel> places = [
  TabBarModel(
      title: "Elephantine Island".tr,
      location: "Aswan".tr,
      image: "assets/images/elephantine-island.jpg",
      price: 320),
  TabBarModel(
      title: "Baron Palace".tr,
      location: "Cairo".tr,
      image: "assets/images/baron.jpg",
      price: 262),
  TabBarModel(
      title: "Alexandria Library".tr,
      location: "Alexandria".tr,
      image: "assets/images/liberary.jpg",
      price: 221)
];
List<TabBarModel> inspiration = [
  TabBarModel(
      title: "Sewa Lake".tr,
      location: "Marsa Matrouh".tr,
      image: "assets/images/sewa.jpg",
      price: 543),
  TabBarModel(
      title: "Valley of the Kings".tr,
      location: "Luxor".tr,
      image: "assets/images/Valley of the Kings.jpg",
      price: 238),
  TabBarModel(
      title: "Prince Mohamed Ali Palace".tr,
      location: "Old Cairo".tr,
      image: "assets/images/manial-palace.jpg",
      price: 124)
];
List<TabBarModel> popular = [
  TabBarModel(
      title: "Karnak Temple".tr,
      location: "Luxor".tr,
      image: "assets/images/Karnak.jpg",
      price: 756),
  TabBarModel(
      title: "Cairo Tower".tr,
      location: "Cairo".tr,
      image: "assets/images/cairo-tower.jpg",
      price: 321),
  TabBarModel(
      title: "Saint Catherine".tr,
      location: "South Sinai".tr,
      image: "assets/images/Catherine.jpg",
      price: 340),
];
