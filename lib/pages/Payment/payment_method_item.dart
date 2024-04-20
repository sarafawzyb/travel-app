import 'package:flutter/material.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem(
      {super.key, this.isActive = false, required this.image});

  final bool isActive;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.50,
                color: isActive ? Colors.deepPurpleAccent : Colors.black45),
            borderRadius: BorderRadius.circular(15)),
        shadows: [
          BoxShadow(
            color: isActive ? Colors.redAccent : Colors.white,
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Center(
          child: Image.asset(
            image,
            //fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
