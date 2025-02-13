import 'package:carousel_slider/carousel_slider.dart';
import 'package:choc_cafe/Screens/menuscreen/menu_screen.dart';
import 'package:choc_cafe/Widgets/HomeScrenCardTwo.dart';
import 'package:choc_cafe/Widgets/carouselcard.dart';
import 'package:choc_cafe/Widgets/colours.dart';
import 'package:choc_cafe/Widgets/favouritecard.dart';
import 'package:choc_cafe/Widgets/homescreencard.dart';
import 'package:choc_cafe/colors.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  State<Favourites> createState() => _State();
}

class _State extends State<Favourites> {
  // List<Widget> CarouselImages = [
  //   Image.asset('assets/images/splashscreen/iklan.png'),
  //   Image.asset('assets/images/splashscreen/iklan.png'),
  //   Image.asset('assets/images/splashscreen/iklan.png'),
  // ];

  bool isMenuOpen = false; // Track menu state

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: GeneralBackground),
            child: Padding(
              padding: const EdgeInsets.only(top: 44, left: 35, right: 35),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Good day, John Smith',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: GeneralText1,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.notifications,
                                color: GeneralText1,
                                size: 34,
                              ),
                              IconButton(
                                icon: Icon(Icons.menu,
                                    color: headingFontColor, size: 30),
                                onPressed: toggleMenu, // Open menu
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 400, // Adjust height as needed
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) => Favouritecard(),
                        itemCount: 7,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
        if (isMenuOpen)
          MenuDrawer(isMenuOpen: isMenuOpen, onClose: toggleMenu),
      ]),
    );
  }
}
