import 'package:flutter/material.dart';

class OrderScreenPastOrdersTab extends StatefulWidget {
  const OrderScreenPastOrdersTab({super.key});

  @override
  State<OrderScreenPastOrdersTab> createState() =>
      _OrderScreenPastOrdersTabState();
}

class _OrderScreenPastOrdersTabState extends State<OrderScreenPastOrdersTab> {
  @override
  Widget build(BuildContext context) {
    var image = [
      'assets/coffee1.png',
      'assets/coffee1.png',
      'assets/coffee1.png',
      'assets/coffee1.png',
      'assets/coffee1.png',
      'assets/coffee1.png',
      'assets/coffee1.png',
      'assets/coffee1.png',
    ];
    var quentity = [
      '2x',
      '1x',
      '2x',
      '1x',
      '2x',
      '1x',
      '2x',
      '1x',
    ];
    var title = [
      'Iced Lemonade',
      'Iced Lemonade',
      'Iced Lemonade',
      'Iced Lemonade',
      'Iced Lemonade',
      'Iced Lemonade',
      'Iced Lemonade',
      'Iced Lemonade',
    ];
    var orderDate = [
      '04/02',
      '04/02',
      '04/02',
      '04/02',
      '04/02',
      '04/02',
      '04/02',
      '04/02',
    ];

    return ListView.builder(
      itemCount: title.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(10),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(252, 242, 217, 1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromRGBO(131, 77, 30, 1),
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Image Section
                  Container( 
                    height: 75,
                    width: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 2.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(image[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Text Section
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 26,
                              child: Text(
                                quentity[index],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(131, 77, 30, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 130,
                              child: Text(
                                title[index],
                                style: TextStyle(
                                  // overflow: TextOverflow.ellipsis,
                                  // height: 1.35,
                                  wordSpacing: 0.1,
                                  letterSpacing: 0.2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(131, 77, 30, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Details',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(131, 77, 30, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Price Section
                ],
              ),
              Container(
                padding: const EdgeInsets.only(right: 10, top: 2),
                child: Text(
                  orderDate[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(131, 77, 30, 1),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
