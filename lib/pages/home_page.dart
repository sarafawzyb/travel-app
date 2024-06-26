import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/pages/baron_page.dart';
import 'package:travel_app/pages/category_pages/beach_page.dart';
import 'package:travel_app/pages/places.dart';
import 'package:travel_app/pages/profile/profile_screen.dart';
import 'package:travel_app/widget/coming_soon.dart';
import '../models/people_also_like_model.dart';
import '../pages/details_page.dart';
import '../widget/reuseable_text.dart';
import '../models/tab_bar_model.dart';
import '../widget/painter.dart';
import '../widget/reuseabale_middle_app_text.dart';
import 'category_pages/boat_page.dart';
import 'category_pages/lake_page.dart';
import 'category_pages/museum_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Category {
  final String name;
  final String imagePath;
  final VoidCallback onTap;

  Category({
    required this.name,
    required this.imagePath,
    required this.onTap,
  });
}

List<Category> categories = [
  Category(
      name: "Beach",
      imagePath: "assets/images/beach.png",
      onTap: () {
        Get.to(BeachPlacesPage());
      }),
  Category(
      name: "Boat",
      imagePath: "assets/images/boat.png",
      onTap: () {
        Get.to(BoatPlacesPage());
      }),
  Category(
      name: "Museum",
      imagePath: "assets/images/museum.png",
      onTap: () {
        Get.to(MuseumPlacesPage());
      }),
  Category(
      name: "Lake",
      imagePath: "assets/images/lake.png",
      onTap: () {
        Get.to(LakePlacesPage());
      }),
  // Category(
  //     name: "Tricycle",
  //     imagePath: "assets/images/tricycle.png",
  //     onTap: () {
  //       Get.to(TricyclePlacesPage());
  //     }),
];

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  String _searchQuery = "";
  List<String> filteredCities = [];

  late final TabController tabController;
  final EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(horizontal: 10.0);

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: _buildAppBar(size),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: padding,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    delay: const Duration(milliseconds: 300),
                    child: AppText(
                      text: "Top Tours".tr,
                      size: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    child: AppText(
                      text: "For Your Request".tr,
                      size: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: size.height * 0.01, top: size.height * 0.02),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                            //searchAndFilter(_searchQuery);
                          });
                        },
                        style: GoogleFonts.ubuntu(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 240, 240, 240),
                          prefixIcon: IconButton(
                            onPressed: () {
                              showSearch(
                                context: context,
                                delegate: CustomSearchDelegate(),
                              );
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              // searchAndFilter(_searchQuery);
                            },
                            icon: const Icon(
                              Icons.filter_alt_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          hintStyle: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          hintText: "Discover City".tr,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //
                  FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      width: size.width,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          labelPadding: EdgeInsets.only(
                              left: size.width * 0.05,
                              right: size.width * 0.05),
                          controller: tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: const CircleTabBarIndicator(
                            color: Colors.deepPurpleAccent,
                            radius: 4,
                          ),
                          tabs: [
                            Tab(
                              text: "Places".tr,
                            ),
                            Tab(text: "Inspiration".tr),
                            Tab(text: "Popular".tr),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 700),
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      width: size.width,
                      height: size.height * 0.4,
                      child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: tabController,
                          children: [
                            TabViewChild(
                              list: places,
                            ),
                            TabViewChild(list: inspiration),
                            TabViewChild(list: popular),
                          ]),
                    ),
                  ),
                  FadeInUp(
                      delay: const Duration(milliseconds: 800),
                      child: MiddleAppText(text: "Find More".tr)),
                  FadeInUp(
                    delay: const Duration(milliseconds: 900),
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      width: size.width,
                      height: size.height * 0.12,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(10.0),
                            width: size.width * 0.16,
                            height: size.height * 0.07,
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  categories[index].onTap();
                                },
                                child: CategoryWidget(
                                  category: categories[index],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  FadeInUp(
                      delay: const Duration(milliseconds: 1000),
                      child: MiddleAppText(text: "People Also Like".tr)),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1100),
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      width: size.width,
                      height: size.height * 0.68,
                      child: ListView.builder(
                          itemCount: peopleAlsoLikeModel.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            PeopleAlsoLikeModel current =
                                peopleAlsoLikeModel[index];
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    personData: current,
                                    tabData: null,
                                    isCameFromPersonSection: true,
                                  ),
                                ),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(8.0),
                                width: size.width,
                                height: size.height * 0.15,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Hero(
                                      tag: current.day,
                                      child: Container(
                                        margin: const EdgeInsets.all(8.0),
                                        width: size.width * 0.28,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              current.image,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * 0.02),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.035,
                                          ),
                                          AppText(
                                            text: current.title,
                                            size: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.005,
                                          ),
                                          AppText(
                                            text: current.location,
                                            size: 14,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontWeight: FontWeight.w300,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: size.height * 0.015),
                                            child: AppText(
                                              text: "${current.day} Day".tr,
                                              size: 14,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar(Size size) {
    return PreferredSize(
      preferredSize: Size.fromHeight(size.height * 0.09),
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 5,
              ),
              child: GestureDetector(
                onTap: (() => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()))),
                child: const CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage("assets/images/Animation - 1712693807260.gif"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              //color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(category.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            category.name,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class TabViewChild extends StatelessWidget {
  const TabViewChild({
    required this.list,
    Key? key,
  }) : super(key: key);

  final List<TabBarModel> list;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: list.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        TabBarModel current = list[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                personData: null,
                tabData: current,
                isCameFromPersonSection: false,
              ),
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Hero(
                tag: current.image,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(current.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: size.height * 0.2,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: size.width * 0.53,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(153, 0, 0, 0),
                        Color.fromARGB(118, 29, 29, 29),
                        Color.fromARGB(54, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: size.width * 0.07,
                bottom: size.height * 0.045,
                child: AppText(
                  text: current.title,
                  size: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Positioned(
                left: size.width * 0.07,
                bottom: size.height * 0.025,
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    AppText(
                      text: current.location,
                      size: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      "assets/images/Animation - 1712693807260.gif"), // Change this to your profile picture
                ),
                SizedBox(height: 10),
                Text(
                  'Sara Mohamed', // Change this to the user's name
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Profile Page'.tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            leading: const Icon(
              Icons.person,
              color: Colors.deepPurpleAccent,
            ),
            onTap: () {
              Get.to(ProfileScreen);
              // Implement navigation to personal page
            },
          ),
          ListTile(
            title: Text(
              'Settings'.tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            leading: const Icon(
              Icons.settings,
              color: Colors.deepPurpleAccent,
            ),
            onTap: () {
              Get.to(ComingSoon);
              // Implement navigation to settings
            },
          ),
          ListTile(
            title: Text(
              'Places'.tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            leading: const Icon(
              Icons.place,
              color: Colors.deepPurpleAccent,
            ),
            onTap: () {
              Get.to(TravelPlacesPage);
              // Implement navigation to places
            },
          ),
          ListTile(
            title: Text(
              'Log Out'.tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            leading: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("login", (route) => false);
              // Implement log out functionality
            },
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Baron Palace".tr,
    "Amr Ibn al'As mosque".tr,
    "Sewa Lake".tr,
    "Valley of the Kings".tr,
    "Qaitbay Citadel".tr,
    "Karnak Temple".tr,
    "Cairo Tower".tr,
    "Saint Catherine".tr,
    "Alexandria Library".tr,
    "Elephantine Island".tr,
    ////////////////////////
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var places in searchTerms) {
      if (places.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(places);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var places in searchTerms) {
      if (places.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(places);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            Get.to(const DestinationPage1());
          },
        );
      },
    );
  }
}
