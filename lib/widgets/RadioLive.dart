import 'package:flutter_radio/flutter_radio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_media_notification/flutter_media_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:rcj/widgets/programacion.dart';


class RadioLive extends StatefulWidget {

  final ScrollController scrollController;
  RadioLive(this.scrollController) ;

  @override
  _RadioLiveState createState() => _RadioLiveState();
}


class _RadioLiveState extends State<RadioLive> {
bool selected = true;
String status = 'hidden';


static const streamUrl = "http://enfoquescreativos.com:8010/stream";

 late bool isPlaying;

 @override
  void initState() {
    super.initState();

    MediaNotification.setListener('pause', () {
      FlutterRadio.playOrPause(url: streamUrl);
      playingStatus();
      setState(() => status = 'pause');
    });

    MediaNotification.setListener('play', () {
      FlutterRadio.playOrPause(url: streamUrl);
      playingStatus();
      setState(() => status = 'play');
    });

    MediaNotification.setListener('next', () {});

    MediaNotification.setListener('prev', () {});

    MediaNotification.setListener('select', () {});
    audioStart();
    playingStatus();
  }

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
    print('Audio Start OK');
  }


  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
         color: Color.fromRGBO(59,66,84,1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
            )
          ),
        
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[              
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Container(
                           margin: const EdgeInsets.only(
                                  top: 2,
                                  left: 10                                                     
                                ),
                           child: Row(
                             children: [
                               IconButton(
                                icon: Icon(selected ?  CupertinoIcons.pause_circle: CupertinoIcons.play_circle, 
                                color: Colors.white,
                                size: 30,),
                                onPressed: () {
                                  MediaNotification.showNotification(
                                  title: 'Estas escuchando', author: 'JosueRadio');
                                  FlutterRadio.playOrPause(url: streamUrl);
                                  playingStatus();
                                },
                        ),
                             ],
                           ),
                         ),
                         Container(
                           margin: const EdgeInsets.only(
                                  top: 5,
                                                                                    
                                ),
                           width: 150,
                                            height: 40,
                           decoration: BoxDecoration(
                             
                             image: DecorationImage(
                               fit: BoxFit.cover,
                               image: ExactAssetImage('assets/img/logo.png')
                               ), 
                             ),
                             
                          
                           
                         ),

                         Container(
                            margin: const EdgeInsets.only(
                                  top: 2, 
                                  right: 10                                                    
                                ),
                           child: IconButton(
                                  icon: Icon(CupertinoIcons.arrowtriangle_up_circle,
                                  color: Colors.white,
                                size: 30,),
                                  onPressed: () {
                                    MediaNotification.showNotification(
                                    title: 'Estas escuchando', author: 'JosueRadio'); 
                                
                                  },
                        ),
                         ),

                         
                       ],
                     ),
                      Container(
                 padding: EdgeInsets.all(20),
                 child: Text('Programacion', style: TextStyle(color: Colors.white, fontSize: 20  , fontFamily: 'NunitoBold')),
               ),

                     Container(
                           child: _programacion()
                         ),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [            
                        ],
                      ),
                  ],
                  ),
              )
            
          ],
          ),
        ),
      );
  
  }
  Future playingStatus() async {
    bool isP = await FlutterRadio.isPlaying();
    setState(() {
      status = 'play';
      isPlaying = isP;
      selected = !selected;
      if(!selected){
        MediaNotification.hideNotification();
      }
    });
  }

  Widget _programacion(){
    return Container(
      child: programacionLista(),
    );
  }
}

