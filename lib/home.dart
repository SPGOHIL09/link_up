
import 'package:flutter/material.dart';
import 'package:link_up/geo_messages.dart';
import 'package:link_up/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1828),
      appBar: AppBar(
        backgroundColor: const Color(0xFF152033),
        elevation: 0,
        title: const Row(
          children: [
            Text(
              'WiFi Direct',
              style: TextStyle(
                color: Color(0xFFF7F7FC),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' Connect',
              style: TextStyle(
                color: Color(0xFF375FFF),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const CircleAvatar(
                  backgroundColor: Color(0xFF375FFF),
                  child: Icon(Icons.person, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF152033),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildFeatureGrid(context),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildConnectionStatus(context),
            ),
            const SizedBox(height: 24),
            _buildRecentConnections(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Connect & Share',
            style: TextStyle(
              color: Color(0xFFF7F7FC),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Connect with nearby devices and share instantly',
            style: TextStyle(
              color: const Color(0xFFF7F7FC).withOpacity(0.7),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _buildFeatureCard(
            context: context,
            icon: Icons.location_on,
            title: 'Geo Messages',
            subtitle: 'Location-based messaging',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const GeoMessagesPage()));
            },

          ),
          _buildFeatureCard(
            context: context,
            icon: Icons.chat_bubble,
            title: 'P2P Chat',
            subtitle: 'Direct messaging',
            onTap: () {},

          ),
          _buildFeatureCard(
            context: context,
            icon: Icons.campaign,
            title: 'Broadcast',
            subtitle: 'Send to everyone nearby',
            onTap: () {},

          ),
          _buildFeatureCard(
            context: context,
            icon: Icons.folder_shared,
            title: 'File Sharing',
            subtitle: 'Share files instantly',
            onTap: () {},

          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF152033),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF375FFF),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Theme.of(context).primaryColor),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConnectionStatus(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF152033),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF375FFF).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'WiFi Direct Active',
            style: TextStyle(
              color: Color(0xFFF7F7FC),
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF375FFF).withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.devices,
                  color: Color(0xFF375FFF),
                  size: 16,
                ),
                SizedBox(width: 4),
                Text(
                  '3 Devices',
                  style: TextStyle(
                    color: Color(0xFF375FFF),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentConnections(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Recent Connections',
            style: TextStyle(
              color: Color(0xFFF7F7FC),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: List.generate(
              4,
                  (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _buildRecentConnectionCard(context),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentConnectionCard(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF152033),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF375FFF).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFF375FFF),
            radius: 24,
            child: Icon(
              Icons.laptop,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Device Name',
            style: TextStyle(
              color: Color(0xFFF7F7FC),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Last connected 2h ago',
            style: TextStyle(
              color: const Color(0xFFF7F7FC).withOpacity(0.5),
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}