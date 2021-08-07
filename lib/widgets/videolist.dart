import 'package:flutter/material.dart';
import 'package:rcj/models/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart';
import 'package:rcj/pages/videosView.dart';

class videoList extends StatefulWidget {
  videoList({Key? key}) : super(key: key);

  @override
  _videoListState createState() => _videoListState();
}

class _videoListState extends State<videoList> {

late ReflexionesH db;
 List docs = [];
 
 initialise(){
   db = ReflexionesH();
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
    return  Column(
      children: [
        Text('data'),
        Flexible(
          child: Container(
            child: ListView.builder(
              shrinkWrap: true,
                itemCount:  docs.length,
                itemBuilder: (BuildContext context, int index){  
                  String url = docs[index]['link'].toString();  
                  String id = url.substring(url.length -11);
                  return GestureDetector(
                    onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => videosView(list: docs, index: index, videoID: id,),
                      ),
                    );
                  },
                    child: Container(
                      height: 200,
                      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage('https://img.youtube.com/vi/${id}/0.jpg')),
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
                                  badgeContent: Text('NUEVO', style: TextStyle(color: Colors.white, fontFamily: 'NunitoExtraBold')),
                                  badgeColor: Color.fromRGBO(243,61,85,1),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,                                                
                                children: <Widget>[                                          
                                  Text(docs[index]['titulo'], style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'NunitoBold'),),
                                  SizedBox(height: 10,),
                                  Text(docs[index]['autor'], style: TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'NunitoBook'),)
                                ],
                              )
                            ],
                          ),),
                      ),
                       
                    ),
                  );
                }
                ),
          ),
        ),
      ],
    );
  }
}