import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rcj/pages/donaciones.dart';
import 'package:url_launcher/url_launcher.dart';


class MenuDos extends StatelessWidget {
  
var _url = 'https://lk.wompi.sv/UQrU';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: 
    GridView.count(
      primary: false,
      padding: const EdgeInsets.all(40),
      crossAxisSpacing: 40,
      mainAxisSpacing: 40,
      crossAxisCount: 2,
      children: <Widget>[
      GestureDetector(
        onTap: (){
          //_launchURL(_url);
          Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => Donaciones(),
                        ),
                      );
        },
        child: Container(
          
          decoration: BoxDecoration(
            color:  Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
            ]
            ),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Icon(CupertinoIcons.heart_circle_fill, color: Color.fromRGBO(59,66,84,1), size: 50,)),
              SizedBox(height: 8,),
              Text('DONAR', style: TextStyle(color: Colors.black, fontFamily: 'NunitoBold', fontSize: 12,))
            ],),
          
        ),
      ),
      Container(
        
        decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
          ]
          ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Icon(CupertinoIcons.list_number_rtl, color: Color.fromRGBO(59,66,84,1), size: 50,)),
            SizedBox(height: 8,),
            Text('NOTAS', style: TextStyle(color: Colors.black, fontFamily: 'NunitoBold', fontSize: 12,))
          ],),
        
      ),
     
      ],
    )
      ),
    );
  }
  void _launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}