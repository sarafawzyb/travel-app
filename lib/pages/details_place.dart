import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'Payment/payment_details.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({Key? key}) : super(key: key);

  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  int _selectedNumberOfPeople = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Elephantine Island',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () async{
              const url = "https://maps.app.goo.gl/5zdPEKGnX9LmX6uz5";
              await launchUrlString(url);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/elephantine-island.jpg',
                    fit: BoxFit.cover,
                    width: 500,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Elephantine Island',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Aswan',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            const Text(
                              '50 LE',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.deepPurpleAccent,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.deepPurpleAccent,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.deepPurpleAccent,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.deepPurpleAccent,
                            ),
                            const Icon(
                              Icons.star_border,
                              color: Colors.deepPurpleAccent,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              '(4.0)',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "People",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text("Number of people in your group",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              final numberOfPeople = index + 1;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedNumberOfPeople = numberOfPeople;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: numberOfPeople ==
                                        _selectedNumberOfPeople
                                        ? Colors.deepPurpleAccent
                                        : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '$numberOfPeople',
                                    style: TextStyle(
                                      color: numberOfPeople ==
                                          _selectedNumberOfPeople
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Elephantine is an island on the Nile, forming part of the city of Aswan in Upper Egypt. The archaeological digs on the island became a World Heritage Site in 1979, along with other examples of Upper Egyptian architecture, as part of the "Nubian Monuments from Abu Simbel to Philae".',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    // Add favorite functionality
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(PaymentDetailsView());
                    // Add booking functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text(
                    'Book Trip Now',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
