import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rcj/models/database.dart';
import 'package:rcj/pages/videosView.dart';
import 'package:rcj/widgets/anuncios_home.dart';
import 'package:rcj/widgets/reflexionesHome.dart';
import 'package:rcj/widgets/videoReciente.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';



class homePrincipal extends StatefulWidget {
  homePrincipal({Key? key}) : super(key: key);

  @override
  _homePrincipalState createState() => _homePrincipalState();
}

class _homePrincipalState extends State<homePrincipal> {

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                          Text( 'Bienvenido a', style: TextStyle(color: Colors.black87, fontSize: 20  , fontFamily: 'NunitoRegular'),),
                          Text( 'JosueRadio', style: TextStyle(color: Colors.black87, fontSize: 55, fontFamily: 'NunitoExtraBold'),),
                          Text( 'Esperamos que todo el contenido que encuentres aqui sea de mucha bendicion y ayuda para tu vida. ', style: TextStyle(color: Colors.black87, fontSize: 15, fontFamily: 'NunitoLight'),),
                          _videoReciente(),
                       Container(
                         margin: const EdgeInsets.only(
                              top: 20,                                                     
                            ),
                         child: Text('Reflexiones de Vida', style: TextStyle(color: Colors.black87, fontSize: 20  , fontFamily: 'NunitoBold'),),
                         
                       ),
                        _Reflexiones(),
                        
                        Container(
                         margin: const EdgeInsets.only(
                              top: 5,                                                     
                            ),
                         child: Text('Anuncios', style: TextStyle(color: Colors.black87, fontSize: 20  , fontFamily: 'NunitoBold'),),
                         
                       ),
                          
                       _AnunciosHome(),
                          
                          
                     
                    ],
                  ),
                ),
              ),
            ),
            
          ],
        
    
    );
  }

  Widget _Reflexiones(){
    return Container(
      child: reflexionesHome(),

    );
  }

  Widget _videoReciente(){
    return Container(
      child: videoReciente(),

    );
  }

  Widget _AnunciosHome(){
  return Container(
    child: anunciosHome()
  );
}



}


