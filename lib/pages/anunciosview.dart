import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

 
 
class anunciosView extends StatefulWidget {
  var list ;
  var index;
 
  
  anunciosView({this.index,this.list}) ;

  @override
  _anunciosViewState createState() => _anunciosViewState();
}

class _anunciosViewState extends State<anunciosView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(widget.list[widget.index]['titulo']),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
                        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.list[widget.index]['imagen'])),
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),                                        
                        ),
               
            ),

            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                     child: Text(widget.list[widget.index]['detalle'], style: TextStyle(color: Colors.black, fontFamily: 'Nunitolight', fontSize: 20,)),
                   ),
              ),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}




