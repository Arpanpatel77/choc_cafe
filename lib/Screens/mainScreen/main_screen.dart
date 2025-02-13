
import 'package:choc_cafe/Screens/bottomnavigationbar/bottom_navigation_bar.dart';
import 'package:choc_cafe/Screens/drinkmenuScreen/drink_menu_screen.dart';
import 'package:choc_cafe/Screens/favourites.dart';
import 'package:choc_cafe/Screens/home_screen.dart';
import 'package:choc_cafe/Screens/orderscreen/order_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    DrinkMenuScreen(),
    OrderScreen(),
    Favourites(),
  ];

  void _onTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack widget in Flutter is a useful tool for managing multiple child widgets, but only displaying one at a time based on a given index.
      body: IndexedStack(

        
      // The index property determines which child widget is currently visible.
      // It is an integer value that corresponds to the position of the child in the children list.
      // For example, if index is set to 0, the first child in the children list will be displayed. If index is set to 1, the second child will be displayed, and so on.
        index: _currentIndex,


        // The children property is a list of widgets that the IndexedStack will manage.
        // All the widgets in the children list are kept in the widget tree, but only the widget at the position specified by the index is visible.
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabChange,
      ),
    );
  }
}
