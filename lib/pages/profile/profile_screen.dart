import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:travel_app/local/locale_controller.dart';
import 'package:travel_app/pages/profile/widget/profile_menu.dart';
import '../../widget/coming_soon.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerLang = Get.find();
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          // titleSpacing: 100,
          // leading: IconButton(
          //   onPressed: () {
          //     Get.to(const MainWrapper());
          //   },
          //   icon: Icon(
          //     Icons.arrow_back_ios,
          //     color: Colors.deepPurpleAccent,
          //   ),
          // ),
          title: Center(
            child: Text(
              "Profile".tr,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage(
                            "assets/images/Animation - 1712693807260.gif"),
                      )),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.deepPurpleAccent,
                    ),
                    child: const Icon(
                      LineAwesomeIcons.alternate_pencil,
                      size: 18.0,
                      color: Colors.black,
                    ),
                  ),
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Sara Mohamed".tr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text("saramohmed50@gmail.com",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  //onPressed: () => Get.to(() => const ComingSoon()),
                  child: Text("Edit Profile".tr,
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),

              //menu
              ProfileMenuWidget(
                title: "Settings".tr,
                icon: LineAwesomeIcons.cog,
                onPress: () {
                  Get.to(const ComingSoon());
                },
              ),
              // ProfileMenuWidget(
              //   title: "Address".tr,
              //   icon: Icons.add_location_alt_outlined,
              //   onPress: () {
              //     Get.to(const ComingSoon());
              //   },
              // ),
              ProfileMenuWidget(
                title: "User Management".tr,
                icon: LineAwesomeIcons.user_check,
                onPress: () {
                  Get.to(const ComingSoon());
                },
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: "Languages".tr,
                icon: LineAwesomeIcons.language,
                onPress: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/translate.png",
                            height: 150,
                            width: 600,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.deepPurpleAccent,
                                padding: const EdgeInsets.only(
                                    right: 120, left: 120) // foreground
                                ),
                            onPressed: () {
                              controllerLang.changeLang("en");
                              Get.forceAppUpdate();
                              Get.appUpdate();
                              Get.back();
                            },
                            child: Text(
                              'English'.tr,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.deepPurpleAccent,
                                padding: const EdgeInsets.only(
                                    right: 120, left: 120) // foreground
                                ),
                            onPressed: () {
                              controllerLang.changeLang("ar");
                              Get.forceAppUpdate();
                              Get.appUpdate();
                              Get.back();
                            },
                            child: Text(
                              'Arabic'.tr,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.deepPurpleAccent,
                                padding: const EdgeInsets.only(
                                    right: 120, left: 120) // foreground
                                ),
                            onPressed: () {
                              controllerLang.changeLang("ru");
                              Get.forceAppUpdate();
                              Get.appUpdate();
                              Get.back();
                            },
                            child: Text(
                              'Russian'.tr,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              ProfileMenuWidget(
                title: "Log out".tr,
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("login", (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
