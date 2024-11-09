import 'package:link_up/Components/messageDiscoverItem.dart';
import 'package:flutter/material.dart';



class MessageDiscoverScreen extends StatefulWidget {
  @override
  _MessageDiscoverScreenState createState() => _MessageDiscoverScreenState();
}

class _MessageDiscoverScreenState extends State<MessageDiscoverScreen> {
  bool isDiscoverSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1828), // Set background color here as well
      appBar: AppBar(
        backgroundColor: Color(0xFF152033),
        elevation: 0,
        title: Text(
          "Message Discover",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold ,color: Colors.white),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          MessageDiscoverItem(
            name: "Alice",
            date: "2023-06-15 at 10:30 AM",
          ),
          MessageDiscoverItem(
            name: "Bob",
            date: "2023-06-14 at 2:45 PM",
          ),
          MessageDiscoverItem(
            name: "Charlie",
            date: "2023-06-13 at 7:20 PM",
          ),
        ],
      ),
    );
  }
}