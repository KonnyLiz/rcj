import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:rcj/models/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart';
import 'package:rcj/pages/videosView.dart';

class anunciosHome extends StatefulWidget {
  anunciosHome({Key? key}) : super(key: key);

  @override
  _anunciosHomeState createState() => _anunciosHomeState();
}

class _anunciosHomeState extends State<anunciosHome> {

late AnunciosH db;
 List docs = [];
 
 initialise(){
   db = AnunciosH();
   db.initialiase();
   db.leer().then((value) => {
     setState((){
       docs = value;

     })
   });

    }


 
 @override
void initState(){
    
    super.initState();
    initialise();
}


  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: 1/.7,
      child: Container(
        
                          margin:  EdgeInsets.only(
                            top: 20,                                                     
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                              itemCount:  docs.length,
                              itemBuilder: (BuildContext context, int index){  
                                
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                      Navigator.of(context).push(
                                        CupertinoPageRoute(
                                          builder: (context) => videosView(list: docs, index: index),
                                        ),
                                      );
                                    },
                                      child: Container(
                                        width: 200,
                                        height: 200,
                                        margin:  EdgeInsets.only(
                            right: 20,  ),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(docs[index]['imagen'])),
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(10),                                        
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              stops: [.2,.8],
                                              colors: [
                                                Colors.black.withOpacity(.2),
                                                Colors.black.withOpacity(.5)
                                              ]
                                            )
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start, 
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Badge(
                                                    shape: BadgeShape.square,
                                                    borderRadius: BorderRadius.circular(8),
                                                    badgeContent: Text('Nuevo', style: TextStyle(color: Colors.white, fontFamily: 'NunitoExtraBold')),
                                                    badgeColor: Color.fromRGBO(243,61,85,1),
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,                                                
                                                  children: <Widget>[                                          
                                                    Text(docs[index]['titulo'], style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'NunitoBold'),),
                                                    SizedBox(height: 10,),
                                                    Text(docs[index]['fecha'].toString(), style: TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'NunitoBook'),)
                                                  ],
                                                )
                                              ],
                                            ),),
                                        ),
                                         
                                      ),
                                    ),
                                  ],
                                );
                              }
                              ),
                        ),
    );
  }
}