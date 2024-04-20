import 'package:get/get.dart';

class WelcomeModel {
  final String title;
  final String subTitle;
  final String description;
  final String imageUrl;

  WelcomeModel({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imageUrl,
  });
}

List<WelcomeModel> welcomeComponents = [
  WelcomeModel(
      title: "Travel".tr,
      subTitle: "Roads".tr,
      description:
          "Live life with no excuses, travel with no regret.".tr,
      imageUrl: "assets/images/cairo.jpg"),
  WelcomeModel(
      title: "Enjoy".tr,
      subTitle: "Seas".tr,
      description:
          "Happiness is traveling with you.".tr,
      imageUrl: "assets/images/alexandria.jpg"),
  WelcomeModel(
      title: "Discover".tr,
      subTitle: "Mountains".tr,
      description:
          "Always say yes to new adventures.".tr,
      imageUrl: "assets/images/Mount_Moses.jpg"),
];
