import 'package:choc_cafe/Widgets/colours.dart';
import 'package:flutter/material.dart';

class Paymentcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162,
      height: 92,
      margin: EdgeInsets.symmetric(horizontal: 10), // Add spacing
      decoration: BoxDecoration(
        color: Colors.brown[200], // Background in case image fails
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage('assets/images/splashscreen/paymentcard.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 11, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Iced Americano',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: GeneralBackground,
              ),
            ),
            Text(
              'Rp 20.000',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: GeneralBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
