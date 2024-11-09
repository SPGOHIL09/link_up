import 'package:link_up/Components/messageReqDiscItem.dart';
import 'package:flutter/material.dart';
import 'package:link_up/messageDiscover.dart';
import 'package:link_up/messagerequest.dart';

class MessageReqDiscScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF0F1828),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 40, bottom: 10, left: 16, right: 16),
              padding: EdgeInsets.all(10),
              width: screenWidth * 0.9,
              height: screenHeight * 0.4,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF375FFF),
                  width: 1,
                ),
                color: Color(0xFF152033),
                borderRadius: BorderRadius.circular(12),
              ),
              child: MessageReqDiscItem(
                icon: Icons.chat_bubble,
                text: 'Connect with your friends\n over local areas',
                messageText: 'Message Request',
                onPressed: () {
                  // Navigate to the homepage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MessageRequestsScreen()),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 40, left: 16, right: 16),
              padding: EdgeInsets.all(10),
              width: screenWidth * 0.9,
              height: screenHeight * 0.4,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF375FFF),
                  width: 1,
                ),
                color: Color(0xFF152033),
                borderRadius: BorderRadius.circular(12),
              ),
              child: MessageReqDiscItem(
                  icon: Icons.person_add,
                  text: 'Discover your new friends\n over local areas',
                  messageText: 'Message Request',
                  onPressed: () {
                    // Navigate to the homepage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MessageDiscoverScreen()),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
