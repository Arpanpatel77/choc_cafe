import 'package:choc_cafe/Screens/home_screen.dart';
import 'package:choc_cafe/Screens/mainScreen/main_screen.dart';
import 'package:choc_cafe/Widgets/colours.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool isLoginSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/common/login.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 100),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ContainerBackground,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Toggle Buttons
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300], // Background for buttons
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ToggleButtons(
                              isSelected: [isLoginSelected, !isLoginSelected],
                              onPressed: (index) {
                                setState(() {
                                  isLoginSelected = index == 0;
                                });
                              },
                              borderRadius: BorderRadius.circular(20),
                              selectedColor: Colors.white,
                              fillColor: Color(0xFF8B5E3C),
                              color: Colors.black, // Unselected color
                              constraints: const BoxConstraints(minHeight: 40, minWidth: 120),
                              children: const [
                                Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),

                          // Username Field
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Username/Email',
                              labelStyle: TextStyle(color: Color(0xFF8B5E3C)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF8B5E3C)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF8B5E3C)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Password Field
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Color(0xFF8B5E3C)),
                              suffixIcon: Icon(Icons.visibility, color: Color(0xFF8B5E3C)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF8B5E3C)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF8B5E3C)),
                              ),
                            ),
                          ),

                          // Confirm Password Field (Only for Sign Up)
                          if (!isLoginSelected) ...[
                            const SizedBox(height: 20),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                labelStyle: TextStyle(color: Color(0xFF8B5E3C)),
                                suffixIcon: Icon(Icons.visibility, color: Color(0xFF8B5E3C)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF8B5E3C)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF8B5E3C)),
                                ),
                              ),
                            ),
                          ],

                          const SizedBox(height: 10),

                          // Forgot Password
                          if (isLoginSelected)
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  // Forgot Password Logic Here
                                },
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(color: Color(0xFF8B5E3C)),
                                ),
                              ),
                            ),
                          const SizedBox(height: 40),

                          // Login/Sign Up Button
                          ElevatedButton(
                            onPressed: () {
                              if (isLoginSelected) {
                                // Navigate to HomeScreen
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => MainScreen()),
                                );
                              } else {
                                // Show success dialog for Sign Up
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Yeay!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      content: Text(
                                        'Please wait patiently for your drink to arrive at your location',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      actions: [
                                        Divider(color: Colors.grey),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              isLoginSelected=true;
                                            });
                                            Navigator.of(context).pop();

                                          },
                                          child: Text(
                                            'Done',
                                            style: TextStyle(fontSize: 16, color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF8B5E3C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                            ),
                            child: Text(
                              isLoginSelected ? 'Login' : 'Sign Up',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
