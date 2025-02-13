import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:choc_cafe/Widgets/colours.dart';

class Addressbox extends StatefulWidget {
  final Function(String) onClose;

  const Addressbox({super.key, required this.onClose});

  @override
  State<Addressbox> createState() => _AddressboxState();
}

class _AddressboxState extends State<Addressbox> {
  final TextEditingController _controller = TextEditingController(); // Text input controller

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Blurred Background
          Positioned.fill(
            child: GestureDetector(
              onTap: () => widget.onClose(_controller.text), // Close on tap outside
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(color: Colors.black26),
              ),
            ),
          ),

          // Address Input Box
          Container(
            decoration: BoxDecoration(
              color: GeneralBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 321,
            height: 210,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your address',
                  style: TextStyle(
                    color: GeneralText1,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: _controller, // Attach controller
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: GeneralText1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: GeneralText1),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onClose(_controller.text); // Pass address back
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GeneralText1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
