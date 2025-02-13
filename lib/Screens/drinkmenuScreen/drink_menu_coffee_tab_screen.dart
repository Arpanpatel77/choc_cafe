import 'package:choc_cafe/Screens/drinkmenuScreen/select_order_and_quentity_screen.dart';
import 'package:flutter/material.dart';


class DrinkMenuCoffeeTabScreen extends StatefulWidget {
  const DrinkMenuCoffeeTabScreen({super.key});

  @override
  State<DrinkMenuCoffeeTabScreen> createState() =>
      _DrinkMenuCoffeeTabScreenState();
}

class _DrinkMenuCoffeeTabScreenState extends State<DrinkMenuCoffeeTabScreen> {
  @override
  Widget build(BuildContext context) {
    var title = [
      'Iced Americano',
      'Iced Americano',
      'Iced Americano',
      'Iced Americano',
      'Iced Americano',
      'Iced Americano',
    ];
    var subTitle = [
      'Double espresso and water, served cold',
      'Double espresso and water, served cold',
      'Double espresso and water, served cold',
      'Double espresso and water, served cold',
      'Double espresso and water, served cold',
      'Double espresso and water, served cold',
    ];
    var image = [
      'assets/coffee1.png',
      'assets/coffee1.png',
      'assets/coffee1.png',
      'assets/coffee1.png',
      'assets/coffee1.png',
      'assets/coffee1.png',
    ];
    var price = [
      '3.50',
      '3.50',
      '3.50',
      '3.50',
      '3.50',
      '3.50',
    ];

    return ListView.builder(
      itemCount: title.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(top: 16),
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // Image Section
              Container(
                height: 110,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(image[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Title, Subtitle and Price Section
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title[index],
                          style: TextStyle(
                            color: Color.fromRGBO(131, 77, 30, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subTitle[index],
                          style: TextStyle(
                            color: Color.fromRGBO(131, 77, 30, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      price[index],
                      style: TextStyle(
                        color: Color.fromRGBO(131, 77, 30, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // Add Button Section
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    isDismissible: true, // Allows closing when clicking outside
                    backgroundColor: Colors.transparent, // Makes edges smooth
                    builder: (context) {
                      return const SelectOrderAndQuantityScreen();
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 25, left: 35),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(131, 77, 30, 1),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
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
