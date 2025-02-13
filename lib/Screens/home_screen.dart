import 'package:carousel_slider/carousel_slider.dart';
import 'package:choc_cafe/Screens/menuscreen/menu_screen.dart';
import 'package:choc_cafe/Widgets/HomeScrenCardTwo.dart';
import 'package:choc_cafe/Widgets/carouselcard.dart';
import 'package:choc_cafe/Widgets/colours.dart';
import 'package:choc_cafe/Widgets/homescreencard.dart';
import 'package:choc_cafe/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _State();
}

class _State extends State<HomeScreen> {
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
                      height: 30,
                    ),
                    Container(
                        width: 321,
                        height: 162,
                        decoration: BoxDecoration(
                            color: GeneralText1,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 26, right: 21),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Best seller of the week',
                                    style: TextStyle(
                                        fontSize: 12, color: GeneralBackground),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    'Iced Coffee\nSweet Heaven',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'More info     ',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: GeneralBackground),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                width: 81,
                                height: 122,
                                decoration: BoxDecoration(
                                    // boxShadow: ,
                                    borderRadius: BorderRadius.circular(13),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/splashscreen/image 1.jpg'),
                                        fit: BoxFit.cover)),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 21,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'This week’s recommendations',
                          style: TextStyle(
                              fontSize: 18,
                              color: GeneralText1,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 15,
                            color: GeneralText1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 220, // Ensure enough height
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, // Show multiple items
                        itemBuilder: (context, index) => Homescreencard(),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'What’s in the shop?',
                      style: TextStyle(
                          fontSize: 18,
                          color: GeneralText1,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    MyCarousel(
                      title: 'Introducing our new lemonade menu',
                      description:
                          'Try our refreshing lemonade, strawberry lemonade, and orange lemonade',
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'A few words from us',
                          style: TextStyle(
                              fontSize: 18,
                              color: GeneralText1,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 15,
                            color: GeneralText1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.transparent,
                      height: 350, // Ensure enough height
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, // Show multiple items
                        itemBuilder: (context, index) => Homescrencardtwo(),
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
