import 'dart:ui';
import 'package:choc_cafe/Screens/loginscreen.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  final VoidCallback onClose; // Callback to close the menu
  final bool isMenuOpen; // Boolean to track if the menu is open
  const MenuDrawer(
      {super.key, required this.onClose, required this.isMenuOpen});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  bool isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    isMenuOpen = widget.isMenuOpen;
  }

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  void logout(BuildContext context) {
    Navigator.pushNamed(context, '/logout');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blurred Background
        Positioned.fill(
          child: GestureDetector(
            onTap: widget.onClose, // Close menu when tapping outside
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(color: Colors.black26),
            ),
          ),
        ),

        // Menu Panel
        AnimatedPositioned(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut, // Smooth easing
          top: 50,
          right: isMenuOpen ? 0 : -200, // Moves in/out from right
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            height: 200,
            width: 180,
            decoration: BoxDecoration(
              color: Color.fromRGBO(248, 227, 182, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                menuItem(context, Icons.person, "Profile"),
                divider(),
                menuItem(context, Icons.settings, "Settings"),
                divider(),
                menuItem(context, Icons.help, "Help"),
                divider(),
                menuItem(context, Icons.logout, "Logout",
                    onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen(),));
                    }
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget menuItem(BuildContext context, IconData icon, String title,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          children: [
            Icon(icon, color: Color.fromRGBO(131, 95, 36, 1)),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(131, 95, 36, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Divider(
        color: Colors.brown.shade300,
        thickness: 0.5,
      ),
    );
  }
}
