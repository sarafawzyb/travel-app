import 'package:flutter/cupertino.dart';
import 'package:travel_app/pages/Payment/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListView();
}

class _PaymentMethodsListView extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItems = const [
    'assets/images/photo_2024-04-10_20-45-38.jpg',
    'assets/images/photo_2024-04-10_20-45-42.jpg',
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 62,
        child: ListView.builder(
            itemCount: paymentMethodsItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                      onTap: () {
                        activeIndex = index;
                        setState(() {});
                      },
                      child: PaymentMethodItem(
                        isActive: activeIndex == index,
                        image: paymentMethodsItems[index],
                      )));
            }));
  }
}
