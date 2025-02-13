import 'package:choc_cafe/Screens/menuscreen/menu_screen.dart';
import 'package:choc_cafe/Screens/orderscreen/order_screen_past_orders_tab.dart';
import 'package:choc_cafe/Screens/orderscreen/order_screen_recently_tab.dart';
import 'package:choc_cafe/colors.dart';
import 'package:flutter/material.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final List<Widget> orderTabName = <Widget>[
    Text('Recently'),
    Text('Past Orders'),
  ];

  final List<bool> _isSelectedOrderTab = <bool>[true, false];

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
          // Main Content
          Positioned.fill(
            child: Container(
              color: backGroundColor,
              padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Orders',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: headingFontColor,
                        ),
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
                      )
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Toggle Buttons
                  Container(
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromRGBO(252, 242, 217, 1),
                    ),
                    child: ToggleButtons(
                      onPressed: (int index) {
                        setState(() {
                          // Toggle the selected tab
                          for (int buttonIndex = 0;
                              buttonIndex < _isSelectedOrderTab.length;
                              buttonIndex++) {
                            _isSelectedOrderTab[buttonIndex] =
                                buttonIndex == index;
                          }
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderColor: Color.fromRGBO(131, 77, 30, 1),
                      selectedBorderColor: Color.fromRGBO(131, 77, 30, 1),
                      selectedColor: Color.fromRGBO(252, 242, 217, 1),
                      fillColor: Color.fromRGBO(131, 77, 30, 1),
                      color: Color.fromRGBO(131, 77, 30, 1),
                      constraints:
                          const BoxConstraints(minHeight: 25, minWidth: 84),
                      textStyle: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w500),
                      isSelected: _isSelectedOrderTab,
                      children: orderTabName,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Tabs
                  Expanded(
                    child: _isSelectedOrderTab[0]
                        ? OrderScreenRecentlyTab()
                        : OrderScreenPastOrdersTab(),
                  ),
                ],
              ),
            ),
          ),

          // Menu Drawer
          if (isMenuOpen)
            MenuDrawer(isMenuOpen: isMenuOpen, onClose: toggleMenu),
        ],
      ),
    );
  }
}
