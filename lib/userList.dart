import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:link_up/model/userDetail.dart';


import 'model/msg.dart';
enum DeviceType { browser, advertiser }
final ValueNotifier<List<Messages>> _messages = ValueNotifier([

]);

class DeviceListScreen extends StatefulWidget {
  const DeviceListScreen({required this.deviceType});
  final DeviceType deviceType;
  @override
  State<DeviceListScreen> createState() => _DeviceListScreenState();
}

class _DeviceListScreenState extends State<DeviceListScreen> {
  List<Device> devices = [];
  List<Device> connectedDevices = [];
  late NearbyService nearbyService;
  late StreamSubscription subscription;
  late StreamSubscription recieveDataSubscription;
  bool isInit = false;


  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    subscription.cancel();
    recieveDataSubscription.cancel();
    nearbyService.stopBrowsingForPeers();
    nearbyService.stopAdvertisingPeer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF152033),
          elevation: 0,
          title: Text("Available Users"),
        ),
        backgroundColor: Color(0xFF0F1828),
        body: ListView.builder(
          itemCount: getItemCount(),
          itemBuilder: (context, index) {
            final device = widget.deviceType == DeviceType.advertiser
                ? connectedDevices[index]
                : devices[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFF152033),
                borderRadius: BorderRadius.circular(12),

              ),
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Msc(device: device, deviceType : widget.deviceType, nearbyService: nearbyService, messages: _messages))),

                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      child: Text(
                        avatarEmoji,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            device.deviceName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            getStateName(device.state),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: getButtonColor(device.state),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => _onButtonClicked(device),
                      child: Row(
                        children: [
                          Icon(Icons.person_add, color: Colors.white, size: 20),
                          SizedBox(width: 4),
                          Text(
                            getButtonStateName(device.state),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  String getStateName(SessionState state) {
    switch (state) {
      case SessionState.notConnected:
        return 'Disconnected';
      case SessionState.connecting:
        return 'Connecting';
      default:
        return 'Connected';
    }
  }

  String getButtonStateName(SessionState state) {
    switch (state) {
      case SessionState.notConnected:
      case SessionState.connecting:
        return "Connect";
      default:
        return "Disconnect";
    }
  }

  Color getStateColor(SessionState state) {
    switch (state) {
      case SessionState.notConnected:
        return Colors.black;
      case SessionState.connecting:
        return Colors.grey;
      default:
        return Colors.green;
    }
  }

  Color getButtonColor(SessionState state) {
    switch (state) {
      case SessionState.notConnected:
      case SessionState.connecting:
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  _onTabItemListener(Device device) {
    if (device.state == SessionState.connected) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            final myController = TextEditingController();
            return AlertDialog(
              title: Text("Send message"),
              content: TextField(controller: myController),
              actions: [
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text("Send"),
                  onPressed: () {
                    nearbyService.sendMessage(
                        device.deviceId, myController.text);
                    myController.text = '';
                  },
                )
              ],
            );
          });
    }
  }

  int getItemCount() {
    if (widget.deviceType == DeviceType.advertiser) {
      return connectedDevices.length;
    } else {
      return devices.length;
    }
  }

  _onButtonClicked(Device device) {
    switch (device.state) {
      case SessionState.notConnected:
        nearbyService.invitePeer(
          deviceID: device.deviceId,
          deviceName: device.deviceName,

        );
        break;
      case SessionState.connected:
        nearbyService.disconnectPeer(deviceID: device.deviceId);
        break;
      case SessionState.connecting:
        break;
    }
  }

  void init() async {
    nearbyService = NearbyService();
    String devInfo = '';
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      devInfo = androidInfo.model;
    }
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      devInfo = iosInfo.localizedModel;
    }
    await nearbyService.init(
        serviceType: 'mpconn',
        deviceName: devInfo,
        strategy: Strategy.P2P_CLUSTER,
        callback: (isRunning) async {
          if (isRunning) {
            if (widget.deviceType == DeviceType.browser) {
              await nearbyService.stopBrowsingForPeers();
              await Future.delayed(Duration(microseconds: 200));
              await nearbyService.startBrowsingForPeers();
            } else {
              await nearbyService.stopAdvertisingPeer();
              await nearbyService.stopBrowsingForPeers();
              await Future.delayed(Duration(microseconds: 200));
              await nearbyService.startAdvertisingPeer();
              await nearbyService.startBrowsingForPeers();
            }
          }
        });
    subscription =
        nearbyService.stateChangedSubscription(callback: (devicesList) {
      devicesList.forEach((element) {
        print(
            " deviceId: ${element.deviceId} | deviceName: ${element.deviceName} | state: ${element.state}");

        if (Platform.isAndroid) {
          if (element.state == SessionState.connected) {
            nearbyService.stopBrowsingForPeers();
          } else {
            nearbyService.startBrowsingForPeers();
          }
        }
      });

      setState(() {
        devices.clear();
        devices.addAll(devicesList);
        connectedDevices.clear();
        connectedDevices.addAll(devicesList
            .where((d) => d.state == SessionState.connected)
            .toList());
      });
    });

    recieveDataSubscription =
        nearbyService.dataReceivedSubscription(callback: (data) {
      print("dataReceivedSubscription: ${jsonEncode(data)}");
      _messages.value = List.from(_messages.value)
        ..add(Messages(text: data["message"], deviceType: widget.deviceType));
      setState(() {});

      // showToast(jsonEncode(data),
      //     context: context,
      //     axis: Axis.horizontal,
      //     alignment: Alignment.center,
      //     position: StyledToastPosition.bottom);
    });
  }

}


class Msc extends StatefulWidget {
  Msc({ required this.device, required this.deviceType, required this.nearbyService, required this.messages});
  Device device;
  late DeviceType deviceType;
  late NearbyService nearbyService;
  ValueNotifier<List<Messages>> messages;
  @override
  State<Msc> createState() => _MscState();
}

class _MscState extends State<Msc> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1828),
      appBar: AppBar(
        toolbarHeight: 62,
        centerTitle: false,
        backgroundColor: Color(0xFF152033),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                children: [
                  // Image.asset("assets/images/chat-bot.png",width: 44),
                  SizedBox(width: 10,),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Text(
                      avatarEmoji,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    widget.device.deviceName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ]
            ),
            // Icon(
            //   ref.read(themeProvider)== ThemeMode.light ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            //   color: Colors.blue.shade500,
            // )
          ],
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 6,),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _messages,
              builder: (context, value, child) => ListView.builder(
                itemCount: widget.messages.value.length,
                itemBuilder: (context, index) {
                  final message = widget.messages.value[index];
                  return ListTile(
                    title: Align(
                      alignment: message.deviceType != widget.deviceType ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: message.deviceType != widget.deviceType ? Colors.blue : Colors.grey[300],
                              borderRadius: message.deviceType != widget.deviceType ?
                              BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ) :
                              BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )
                          ),
                          child: Text(
                            message.text,
                            style: TextStyle(color: message.deviceType != widget.deviceType ? Colors.white : Colors.black),
                          )
                      ),
                    ),
                  );
                },
              ),


            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 18,top: 16.0,left: 16,right: 16),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3)
                    )
                  ]
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: 'Message!!',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20)
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),

                  IconButton(
                      onPressed: (){
                        widget.nearbyService.sendMessage(widget.device.deviceId, _controller.text);
                        _messages.value.add(Messages(text: _controller.text, deviceType: widget.deviceType == DeviceType.advertiser ? DeviceType.browser : DeviceType.advertiser));
                        _controller.text = '';
                        setState(() {});
                      },
                      icon: Icon(Icons.send_rounded, color: Colors.blue.shade300,)
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }


}

