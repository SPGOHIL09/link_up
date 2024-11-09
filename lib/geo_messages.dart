import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'home.dart';

class GeoMessagesPage extends StatefulWidget {
  const GeoMessagesPage({Key? key}) : super(key: key);

  @override
  State<GeoMessagesPage> createState() => _GeoMessagesPageState();
}

class _GeoMessagesPageState extends State<GeoMessagesPage> {
  final List<GeoMessage> _messages = [
    GeoMessage(
      sender: 'John Doe',
      title: 'Meeting Location',
      message: 'The meeting is at the downtown office, 123 Main St.',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      latitude: 40.730610,
      longitude: -73.935242,
    ),
    GeoMessage(
      sender: 'Jane Smith',
      title: 'Lunch Spot',
      message: 'Let\'s meet at the new café on 4th Avenue.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
      latitude: 40.727239,
      longitude: -73.995831,
    ),
    GeoMessage(
      sender: 'Michael Johnson',
      title: 'Event Location',
      message: 'The party is at 789 Park Avenue, 10th floor.',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      latitude: 40.753963,
      longitude: -73.970633,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1828),
      appBar: AppBar(
        backgroundColor: const Color(0xFF152033),
        elevation: 0,
        title: const Text(
          'Geo Messages',
          style: TextStyle(
            color: Color(0xFFF7F7FC),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF7F7FC)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            margin:  const EdgeInsets.only(top:16, left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Save profile changes
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Profile updated successfully'),
                      backgroundColor: Color(0xFF375FFF),
                    ),
                  );

                  // Navigate to the homepage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomePage()), // Replace `HomePage` with your actual homepage widget
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF375FFF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Search Messages Nearby',
                  style: TextStyle(
                    color: Color(0xFFF7F7FC),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final message = _messages[index];
                return GeoMessageCard(
                  sender: message.sender,
                  title: message.title,
                  message: message.message,
                  timestamp: message.timestamp,
                  latitude: message.latitude,
                  longitude: message.longitude,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF375FFF),
        onPressed: () {
          // Navigate to add new geo message
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class GeoMessage {
  final String sender;
  final String title;
  final String message;
  final DateTime timestamp;
  final double latitude;
  final double longitude;

  GeoMessage({
    required this.sender,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.latitude,
    required this.longitude,
  });
}

class GeoMessageCard extends StatelessWidget {
  final String sender;
  final String title;
  final String message;
  final DateTime timestamp;
  final double latitude;
  final double longitude;

  const GeoMessageCard({
    Key? key,
    required this.sender,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF152033),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF375FFF).withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF375FFF).withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFF375FFF),
                child: Text(
                  sender[0].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sender,
                      style: const TextStyle(
                        color: Color(0xFFF7F7FC),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: TextStyle(
                        color: const Color(0xFFF7F7FC).withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                DateFormat('hh:mm a').format(timestamp),
                style: TextStyle(
                  color: const Color(0xFFF7F7FC).withOpacity(0.5),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: TextStyle(
              color: const Color(0xFFF7F7FC).withOpacity(0.8),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: const Color(0xFF375FFF),
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                '$latitude, $longitude',
                style: const TextStyle(
                  color: Color(0xFF375FFF),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}