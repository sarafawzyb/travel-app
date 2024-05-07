import 'package:get/get.dart';

class PeopleAlsoLikeModel {
  final String title;
  final String location;
  final int day;
  final String image;
  final int price;

  PeopleAlsoLikeModel(
      {required this.title,
      required this.location,
      required this.day,
      required this.image,
      required this.price});
}

List<PeopleAlsoLikeModel> peopleAlsoLikeModel = [
  PeopleAlsoLikeModel(
      title: "Baron Palace".tr,
      location: "Cairo".tr,
      image: "assets/images/baron.jpg",
      day: 5,
      price: 430),
  PeopleAlsoLikeModel(
      title: "Amr Ibn al'As mosque".tr,
      location: "Cairo".tr,
      image: "assets/images/gam3.jpg",
      day: 7,
      price: 233),
  PeopleAlsoLikeModel(
      title: "Sewa Lake".tr,
      location: "Marsa Matrouh".tr,
      image: "assets/images/sewa.jpg",
      day: 9,
      price: 550),
  PeopleAlsoLikeModel(
      title: "Qaitbay Citadel".tr,
      location: "Alexandria".tr,
      image: "assets/images/Qaitbay.jpg",
      day: 3,
      price: 546),
];
