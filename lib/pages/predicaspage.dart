import 'package:flutter/material.dart';
import 'package:rcj/models/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart';
import 'package:rcj/pages/videosView.dart';
import 'package:share/share.dart';

class PredicasPage extends StatefulWidget {
  PredicasPage({Key? key}) : super(key: key);

  @override
  _PredicasPageState createState() => _PredicasPageState();
}

class _PredicasPageState extends State<PredicasPage> {
  bool categoria1 = true;
  bool categoria2 = false;
  bool categoria3 = false;
  bool categoria4 = false;
  late int numero;

late Videos db;
 List docs = [];
 
 initialise(int numeros){
   db = Videos();
   db.initialiase();
   db.leer(numeros).then((value) => {
     setState((){
       docs = value;

     })
   });

    }


 
 @override
void initState(){
  numero = 0;
  initialise(numero);
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
                       child: Text( 'Videos', style: TextStyle(color: Colors.black87, fontSize: 55  , fontFamily: 'NunitoBold'),)
                       ),
                       
                       Container(
                         margin: EdgeInsets.only( left: 20, right: 20),
                         height: 50,
                         child: ListView(
                           scrollDirection:Axis.horizontal,
                           children: <Widget>[
                             GestureDetector(
                               onTap: (){
                                
                                  setState(() {
                                   initialise(0);
                                  categoria1 = true;
                                  categoria2 = false;
                                  categoria3 = false;
                                  categoria4 = false;
                                });
                                  
                                

                              },
                               child: categoria(isActive: categoria1, titulo: 'Todos')),
                             GestureDetector(
                               onTap: (){
                                
                                   setState(() {
                                     initialise(1);
                                  categoria1 = false;
                                  categoria2 = true;
                                  categoria3 = false;
                                  categoria4 = false;
                                });
                                  
                                

                              },
                               child: categoria(isActive: categoria2, titulo: 'Predicas')),
                             GestureDetector(
                               onTap: (){
                                
                                   setState(() {
                                     initialise(2);
                                  categoria1 = false;
                                  categoria2 = false;
                                  categoria3 = true;
                                  categoria4 = false;
                                });
                                  
                                
                              },
                               child: categoria(isActive: categoria3, titulo: 'Reflexiones')),
                             GestureDetector(
                               onTap: (){
                                
                                   setState(() {
                                  initialise(3);
                                  categoria1 = false;
                                  categoria2 = false;
                                  categoria3 = false;
                                  categoria4 = true;
                                });
                                  
                                

                              },
                               child: categoria(isActive: categoria4, titulo: 'Congresos')),                          
                           ],
                           ),
                       ),
          ],),
                        SizedBox(height: 20,),
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
                                  child: Container(
                                    child: IconButton(
                                      icon: Icon(Icons.share, color: Colors.white, size: 25,),
                                      onPressed: (){
                                        Share.share(docs[index]['link'].toString());
                                      },
                                      ),
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
  Widget categoria({isActive, titulo}){
    var color1 = Color.fromRGBO(59,66,84,1);
    var color2 = Color.fromRGBO(128,128,128,1);
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.5/1,
      child: Container(
         margin: EdgeInsets.only(right: 10),
         decoration: BoxDecoration(
           color: isActive ? color1 : color2,
           borderRadius: BorderRadius.circular(50),
         ),
         child: Align(
           child: Text(
             titulo, style: TextStyle(color: Colors.white, fontSize: 15  , fontFamily: 'NunitoBold')
             ),
             ),
      ),
      
      );

  }
}


  


