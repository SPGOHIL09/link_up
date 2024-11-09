import 'package:link_up/Components/messageReqDiscItem.dart';
import 'package:flutter/material.dart';
import 'package:link_up/messageDiscover.dart';
import 'package:link_up/messagerequest.dart';
import 'package:link_up/userList.dart';
// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case '/':
//       return MaterialPageRoute(builder: (_) => MessageReqDiscScreen());
//     case 'browser':
//       return MaterialPageRoute(
//           builder: (_) => DeviceListScreen(deviceType: DeviceType.browser));
//     case 'advertiser':
//       return MaterialPageRoute(
//           builder: (_) => DeviceListScreen(deviceType: DeviceType.advertiser));
//     default:
//       return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(
//                 child: Text('No route defined for ${settings.name}')),
//           ));
//   }
// }


class MessageReqDiscScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF152033),
        elevation: 0,
        title: Text(
          "Chats",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold ,color: Colors.white),
        ),
      ),
      backgroundColor: Color(0xFF0F1828),
      body: Column(
        children: [
          Expanded(
            child: Center(
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
                child: Center(
                  child: MessageReqDiscItem(
                    icon: Icons.chat_bubble,
                    text: 'Connect with your friends\n over local areas',
                    messageText: 'Create Chat',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeviceListScreen(deviceType: DeviceType.browser),
                        ),
                      );
                    },
                  ),
                ),
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
                  messageText: 'Connect to Chat',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeviceListScreen(deviceType: DeviceType.advertiser),
                      ),
                    );

                  }),
            ),
          ),
        ],
      ),
    );
  }
}
