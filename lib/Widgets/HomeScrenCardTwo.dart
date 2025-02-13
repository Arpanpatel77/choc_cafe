import 'package:choc_cafe/Widgets/colours.dart';
import 'package:flutter/material.dart';

class Homescrencardtwo extends StatefulWidget {
  const Homescrencardtwo({super.key});

  @override
  State<Homescrencardtwo> createState() => _HomescrencardtwoState();
}

class _HomescrencardtwoState extends State<Homescrencardtwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 25),
      width: 162,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/splashscreen/unsplash.jpg'))),
                width: double.infinity,
                height: 200,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Why Co/Choc?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: GeneralText1,
                ),
              ),
              Text(
                'Since 2018, Co/Choc provides you with our best coffee or chocolate...',
                style: TextStyle(
                  fontSize: 12,
                  color: GeneralText1,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            child: Text(
              'Read more',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: GeneralText1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
