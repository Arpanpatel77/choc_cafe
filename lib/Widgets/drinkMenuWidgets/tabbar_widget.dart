import 'package:flutter/material.dart';

class TabbarWidget extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Function(int) onPressed;
  final String title;

  const TabbarWidget({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Use Expanded to take equal space
      child: InkWell(
        onTap: () {
          onPressed(index);
        },
        child: Container(
          height: 32,
          decoration: BoxDecoration(
            color: (currentIndex == index)
                ? const Color.fromRGBO(131, 77, 30, 1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: (currentIndex == index)
                    ? const Color.fromRGBO(252, 242, 217, 1)
                    : const Color.fromRGBO(131, 77, 30, 1),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
