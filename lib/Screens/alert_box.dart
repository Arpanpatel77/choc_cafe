import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  const AlertBox({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        FocusScope.of(context).unfocus();
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                titlePadding: EdgeInsets.only(top: 20),
                contentPadding:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                actionsPadding: EdgeInsets.zero,
                title: Text(
                  textAlign: TextAlign.center,
                  'Yeay!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                content: Text(
                  textAlign: TextAlign.center,
                  'Please wait patiently for your drink to arrive at your location',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  Divider(
                    color: Colors.grey,
                    indent: 0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10, top: 2),
                      decoration: BoxDecoration(),
                      alignment: Alignment.center,
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            });
      },
      icon: Icon(Icons.notifications, color: Colors.amber),
    );
  }
}
