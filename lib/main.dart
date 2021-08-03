import 'package:flutter/material.dart';
import 'package:rcj/pages/homepage.dart';
import 'package:rcj/pages/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {


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
        'menu'      : (BuildContext context) => MenuApp(),
        
        },
        
    );
  }
}