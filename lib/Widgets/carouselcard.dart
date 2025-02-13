import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarousel extends StatelessWidget {
  final List<String> CarouselImages = [
    'assets/images/splashscreen/iklan.png',
    'assets/images/splashscreen/iklan.png',
    'assets/images/splashscreen/iklan.png',
  ];

  final String title;
  final String description;

   MyCarousel({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        height: 162,
        aspectRatio: 16 / 16,
        autoPlayCurve: Curves.easeInOut,
        viewportFraction: 1.0,
        autoPlayAnimationDuration: Duration(milliseconds: 500),
      ),
      items: CarouselImages.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: 305,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(
                      imagePath,
                    ))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 32, left: 27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 133,
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                        width: 245,
                        child: Text(
                          description,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ) // Using asset images
                );
          },
        );
      }).toList(),
    );
  }
}
