import 'package:choc_cafe/Screens/drinkmenuScreen/drink_menu_chocolate_tab_screen.dart';
import 'package:choc_cafe/Screens/drinkmenuScreen/drink_menu_coffee_tab_screen.dart';
import 'package:choc_cafe/Screens/drinkmenuScreen/drink_menu_others_tab_screen.dart';
import 'package:choc_cafe/Screens/menuscreen/menu_screen.dart';
import 'package:choc_cafe/Widgets/drinkMenuWidgets/tabbar_widget.dart';
import 'package:choc_cafe/colors.dart';
import 'package:flutter/material.dart';


class DrinkMenuScreen extends StatefulWidget {
  const DrinkMenuScreen({super.key});

  @override
  State<DrinkMenuScreen> createState() => _DrinkMenuScreenState();
}

class _DrinkMenuScreenState extends State<DrinkMenuScreen> {
  int _currentIndex = 0;

  // List Of Tabs
  final List<Widget> _tabScreens = [
    DrinkMenuCoffeeTabScreen(),
    DrinkMenuChocolateTabScreen(),
    DrinkMenuOthersTabScreen(),
  ];

  bool isMenuOpen = false; // Track menu state

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: backGroundColor,
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 40, left: 30, right: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What would you \nlike to drink today?",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: headingFontColor),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: headingFontColor,
                                  size: 30,
                                ),

                                IconButton(
                                  icon: Icon(Icons.menu,
                                      color: headingFontColor, size: 30),
                                  onPressed: toggleMenu, // Open menu
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 22),
                        SizedBox(
                          height: 36,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 16),
                              hintText: "Search..",
                              hintStyle: TextStyle(
                                color: headingFontColor,
                              ),
                              filled: true,
                              fillColor: Color.fromRGBO(252, 242, 217, 1),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(131, 77, 30, 1)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(131, 77, 30, 1)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        Container(
                          height: 32,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(252, 242, 217, 1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color.fromRGBO(131, 77, 30, 1),
                            ),
                          ),
                          child: Row(
                            children: [
                              TabbarWidget(
                                index: 0,
                                currentIndex: _currentIndex,
                                onPressed: (index) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                                title: "Coffee",
                              ),
                              Container(
                                width: 0.6,
                                height: 15, // Adjust height to match text
                                color: const Color.fromRGBO(131, 77, 30, 1),
                              ),
                              TabbarWidget(
                                index: 1,
                                currentIndex: _currentIndex,
                                onPressed: (index) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                                title: "Chocolate",
                              ),
                              Container(
                                width: 0.6,
                                height: 15, // Adjust height to match text
                                color: const Color.fromRGBO(131, 77, 30, 1),
                              ),
                              TabbarWidget(
                                index: 2,
                                currentIndex: _currentIndex,
                                onPressed: (index) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                                title: "Others",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      margin: const EdgeInsets.only(top: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(252, 242, 217, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        border: Border.all(
                            color: Color.fromRGBO(131, 77, 30, 1), width: 1.5),
                      ),
                      child: _tabScreens[_currentIndex],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isMenuOpen)
            MenuDrawer(isMenuOpen: isMenuOpen, onClose: toggleMenu),
        ],
      ),
    );
  }
}
