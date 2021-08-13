import 'package:flutter/material.dart';
import 'package:rcj/models/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart';
import 'package:rcj/pages/videosView.dart';
import 'package:share/share.dart';


class reflexionesHome extends StatefulWidget {
  reflexionesHome({Key? key}) : super(key: key);

  @override
  _reflexionesHomeState createState() => _reflexionesHomeState();
}

class _reflexionesHomeState extends State<reflexionesHome> {

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
        AspectRatio(
          aspectRatio: 1/0.5,
          child: Container(
            
                              margin:  EdgeInsets.only(
                                top: 20,                                                     
                              ),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                  itemCount:  docs.length,
                                  itemBuilder: (BuildContext context, int index){  
                                    String url = docs[index]['link'].toString();  
                                    String id = url.substring(url.length -11);
                                    return Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                          Navigator.of(context).push(
                                            CupertinoPageRoute(
                                              builder: (context) => videosView(list: docs, index: index, videoID: id,),
                                            ),
                                          );
                                        },
                                          child: Container(
                                            width: 267,
                                            height: 150,
                                            margin:  EdgeInsets.only(
                                right: 20,  ),
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
                                                      child: IconButton(
                                                        icon: Icon(Icons.share, color: Colors.white, ),
                                                        onPressed: (){
                                                          Share.share(docs[index]['link'].toString());
                                                        },
                                                        ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,                                                
                                                      children: <Widget>[                                          
                                                        Text(docs[index]['titulo'], style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'NunitoBold'),),
                                                        
                                                        Text(docs[index]['autor'], style: TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'NunitoBook'),)
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
        ),
        
      ],
    );
  }
}