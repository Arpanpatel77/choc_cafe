import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(131, 77, 30, 1), // Background color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildNavItem(Icons.home_filled, Icons.home_outlined, "Home", 0),
          buildNavItem(
              Icons.local_cafe, Icons.local_cafe_outlined, "Drink Menu", 1),
          buildNavItem(
              Icons.receipt_long, Icons.receipt_long_outlined, "Your Order", 2),
          buildNavItem(Icons.favorite, Icons.favorite_border, "Favorites", 3),
        ],
      ),
    );
  }

  Widget buildNavItem(
      IconData selectedIcon, IconData unselectedIcon, String label, int index) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index), // Notify parent screen to change page
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? selectedIcon : unselectedIcon,
            color: Color.fromRGBO(248, 227, 182, 1),
            size: 28,
          ),
          Text(
            label,
            style: TextStyle(
              color: Color.fromRGBO(248, 227, 182, 1),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 2),
          if (isSelected)
            Container(
              width: 20,
              height: 3,
              decoration: BoxDecoration(
                color: Color.fromRGBO(248, 227, 182, 1),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }
}
