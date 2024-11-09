import 'package:flutter/material.dart';

class Landingpage1 extends StatefulWidget {
  const Landingpage1({super.key});

  @override
  State<Landingpage1> createState() => _Landingpage1State();
}

class _Landingpage1State extends State<Landingpage1> {
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
                  'Bridging Connections \nBeyond the Internet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Seamlessly connect with people around you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child:  Text(
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