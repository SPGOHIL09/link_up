import 'package:flutter/material.dart';

class MessageReqDiscItem extends StatelessWidget {
  final String text;
  final String messageText;
  final IconData icon;
  final VoidCallback onPressed;

  const MessageReqDiscItem({
    required this.text,
    required this.messageText,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(height: 35,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: screenWidth * 0.2,
            height: screenWidth * 0.2,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.blue,
                size: screenWidth * 0.1,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: screenWidth * 0.04,
          ),
        ),
        SizedBox(
          width: 12,
          height: screenHeight * 0.05,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(screenWidth * 0.03),
          ),
          onPressed:onPressed,
          child: Center(
            child: Text(
              messageText,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
