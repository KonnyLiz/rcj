import 'package:flutter/material.dart';
import 'package:rcj/models/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart';
import 'package:rcj/pages/anunciosview.dart';
import 'package:rcj/pages/videosView.dart';

class Anuncios extends StatefulWidget {
  Anuncios({Key? key}) : super(key: key);

  @override
  _AnunciosState createState() => _AnunciosState();
}

class _AnunciosState extends State<Anuncios> {
 

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
  
  initialise();
}


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Container(
                       margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                       child: Text( 'Anuncios', style: TextStyle(color: Colors.black87, fontSize: 55  , fontFamily: 'NunitoBold'),)
                       ),
                      
          ],),
                        SizedBox(height: 20,),
          Flexible(
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount:  docs.length,
                  itemBuilder: (BuildContext context, int index){  
                    
                    return GestureDetector(
                      onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => anunciosView(list: docs, index: index,),
                        ),
                      );
                    },
                      child: Container(
                        height: 200,
                        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
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
                                  child: IconButton(
                                    icon: Icon(CupertinoIcons.clock_fill, color: Colors.white,),
                                    onPressed: (){},)
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,                                                
                                  children: <Widget>[                                          
                                    Text(docs[index]['titulo'], style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'NunitoBold'),),
                                    SizedBox(height: 10,),
                                    Text(docs[index]['fecha'], style: TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'NunitoBook'),)
                                  ],
                                )
                              ],
                            ),
                            ),
                        ),
                         
                      ),
                    );
                  }
                  ),
            ),
          ),
          Container(
            height: 37,
          ),
        ],
      ),
    );
  }                           
  
}


  


