import 'package:flutter/material.dart';
import 'package:link_up/home.dart';
import 'package:link_up/profile.dart';

class Landingpage3 extends StatefulWidget {
  const Landingpage3({super.key});

  @override
  State<Landingpage3> createState() => _Landingpage3State();
}

class _Landingpage3State extends State<Landingpage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1828),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Top illustrations
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Left illustration
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      // Right illustration
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.chat_bubble,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Geo Messaging: Messages connected to your location',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Get Meassages floating around your place',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 650),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the homepage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(), // Replace HomePage with your homepage widget
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Create Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Text(
                'Terms & Privacy Policy',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
