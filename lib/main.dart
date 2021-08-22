import 'package:flutter/material.dart';
import 'package:rcj/pages/homepage.dart';
import 'package:rcj/pages/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:awesome_notifications/awesome_notifications.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
      null, // icon for your app notification
      [
        NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'Basic Notifications',
      defaultColor: Colors.teal,
      importance: NotificationImportance.High,
      channelShowBadge: true, 
        )
      ]
  );
  await Firebase.initializeApp();
  runApp(Myapp());
}


class Myapp extends StatefulWidget {
  Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  static final String appid = "e272644d-61c7-4a61-a52d-e6a933012582";

  @override
  
  void initState() { 
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JosueRadio' ,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: 'menu',
      routes: {
        'menu'      : (BuildContext context) => MenuApp() ,
        
        },
        
    );
  }

  Future<void> initPlatformState() async{
    OneSignal.shared.setAppId(appid);
  }
}