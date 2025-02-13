import 'package:choc_cafe/Screens/home_screen.dart';
import 'package:choc_cafe/Screens/mainScreen/main_screen.dart';
import 'package:choc_cafe/Widgets/addressbox.dart';
import 'package:choc_cafe/Widgets/colours.dart';
import 'package:choc_cafe/Widgets/paymentcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final Map<String, double> fees = {
    'Subtotal': 24.000,
    'Delivery fee': 3.000,
    'Packaging fee': 5.000,
    'Promo': 0,
  };

  String _address = "No saved address"; // Default address

  void _updateAddress(String newAddress) {
    setState(() {
      _address = newAddress; // Update UI with new address
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            color: GeneralBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 36, top: 50, right: 33),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.paperplane_fill,
                            color: Colors.blue,
                          ),
                          Text(
                            'Closest cafe:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: GeneralText1,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Co/Choc Tebet (1.5 km)',
                        style: TextStyle(color: GeneralText1, fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 248,
                        child: Text(
                          'Jl. Santuy no. 41, Tebet Barat, Tebet, Jakarta Selatan',
                          style: TextStyle(color: GeneralText1, fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        height: 20,
                        thickness: 1,
                        color: GeneralText1,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: Colors.red,
                          ),
                          Text(
                            'Deliver to:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: GeneralText1,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              _address, // Display updated address
                              style: TextStyle(color: GeneralText1, fontSize: 14),
                              overflow: TextOverflow.ellipsis, // Prevent overflow
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Addressbox(
                                    onClose: (String newAddress) {
                                      _updateAddress(newAddress);
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                              );
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: GeneralText1,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
                Divider(
                  height: 50,
                  thickness: 20,
                  color: GeneralText1,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 36, top: 27, right: 33),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your order:',
                        style: TextStyle(
                          fontSize: 16,
                          color: GeneralText1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '1x',
                            style: TextStyle(fontSize: 14, color: GeneralText1),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              'Iced Coffee Sweet Heaven',
                              style: TextStyle(fontSize: 14, color: GeneralText1),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: GeneralText1,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 59),
                        child: Text(
                          'Rp 24.000',
                          style: TextStyle(fontSize: 16, color: GeneralText1),
                        ),
                      ),
                      Divider(height: 15, color: GeneralText1),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Other drinks we recommend',
                            style: TextStyle(
                              color: GeneralText1,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(color: GeneralText1, fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 27),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 35),
                  width: double.infinity,
                  height: 85,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => Paymentcard(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 35, right: 35),
                  child: Column(
                    children: fees.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(entry.key, style: TextStyle(color: GeneralText1, fontSize: 14)),
                            Text("Rp ${entry.value.toStringAsFixed(3)}", style: TextStyle(color: GeneralText1, fontSize: 14)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: GeneralText1, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      onPressed: () => print("clicked"),
                      child: Text("Cancel", style: TextStyle(color: GeneralText1)),
                    ),
                    SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Yeay!', textAlign: TextAlign.center),
                              content: Text('Please wait patiently for your drink to arrive.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
                                  },
                                  child: Text('Done', style: TextStyle(color: Colors.blue)),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: GeneralText1),
                      child: Text("Proceed Payment", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
