import 'package:link_up/Components/messageRequestItem.dart';
import 'package:flutter/material.dart';


class MessageRequestsScreen extends StatefulWidget {
  @override
  _MessageRequestsScreenState createState() => _MessageRequestsScreenState();
}

class _MessageRequestsScreenState extends State<MessageRequestsScreen> {
  bool isDiscoverSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF0F1828),
      appBar: AppBar(
        backgroundColor: Color(0xFF152033),
        elevation: 0,
        title: Text(
          "Message Requests",
          style: TextStyle(fontSize: 24, 
          fontWeight: FontWeight.bold ,
          color: Colors.white
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          MessageRequestItem(
            name: "Alice",
            date: "2023-06-15 ",
            time: "10:30 AM",
          ),
          MessageRequestItem(
            name: "Bob",
            date: "2023-06-14",
            time: "2:45 PM",
          ),
          MessageRequestItem(
            name: "Charlie",
            date: "2023-06-13",
            time: "11:15 AM",
          ),
        ],
      ),
    );
  }
}


