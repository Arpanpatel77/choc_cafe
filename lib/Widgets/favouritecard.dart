import 'package:choc_cafe/Screens/drinkmenuScreen/select_order_and_quentity_screen.dart';
import 'package:choc_cafe/Screens/favourites.dart';
import 'package:choc_cafe/Widgets/colours.dart';
import 'package:choc_cafe/Widgets/favouritetab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favouritecard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: true, // Allows closing when clicking outside
          backgroundColor: Colors.transparent, // Makes edges smooth
          builder: (context) {
            return Favouritetab();
          },
        );
      },
      child: Container(
        width: 162,
        height: 200,
        margin: EdgeInsets.symmetric(horizontal: 10),
        // Add spacing
        decoration: BoxDecoration(
          color: Colors.brown[200], // Background in case image fails
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage('assets/images/splashscreen/Group 11.jpg'),
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
              Row(
                children: [
                  Text(
                    'Rp 20.000',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: GeneralBackground,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(CupertinoIcons.suit_heart_fill, color: Colors.red,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
