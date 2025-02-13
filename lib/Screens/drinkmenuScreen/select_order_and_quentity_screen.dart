import 'package:choc_cafe/Screens/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectOrderAndQuantityScreen extends StatefulWidget {
  const SelectOrderAndQuantityScreen({super.key});

  @override
  State<SelectOrderAndQuantityScreen> createState() =>
      _SelectOrderAndQuantityScreenState();
}

class _SelectOrderAndQuantityScreenState
    extends State<SelectOrderAndQuantityScreen> {
  bool isPressed = false;
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(

      initialChildSize: 0.75,
      // 60% of screen height
      minChildSize: 0.75,
      // Allows dismissing completely
      maxChildSize: 0.95,
      // Expand up to 90% of screen
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/attribute-drink-details.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(20),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isPressed = !isPressed;
                      });
                    },
                    icon: Icon(
                      isPressed
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: isPressed ? Colors.red : Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.37),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Iced Coffee Sweet Heaven",
                    style: TextStyle(
                      color: Color.fromRGBO(131, 77, 30, 1),
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Double espresso with condensed milk, served cold",
                    style: TextStyle(
                      color: Color.fromRGBO(131, 77, 30, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Price: \$3.50",
                    style: TextStyle(
                      color: Color.fromRGBO(131, 77, 30, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_itemCount > 0) {
                              _itemCount -= 1;
                            }
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(131, 77, 30, 1),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                      Text(
                        _itemCount.toString(),
                        style: TextStyle(
                          color: Color.fromRGBO(131, 77, 30, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _itemCount += 1;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 15),
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
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 120,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromRGBO(131, 77, 30, 1),
                        ),
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => Payment(),));
                          },
                          child: Text('Buy Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
