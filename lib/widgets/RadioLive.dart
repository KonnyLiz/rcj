import 'package:flutter_radio/flutter_radio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_media_notification/flutter_media_notification.dart';


class RadioLive extends StatefulWidget {

  final ScrollController scrollController;
  RadioLive(this.scrollController) ;

  @override
  _RadioLiveState createState() => _RadioLiveState();
}


class _RadioLiveState extends State<RadioLive> {
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
                     Container(
                       margin: const EdgeInsets.only(
                              top: 5,                                                     
                            ),
                       child: Center(
                          child: Text( 'JosueRadio', style: TextStyle(color: Colors.black87, fontSize: 25, fontFamily: 'NunitoExtraBold'),),
                        ),
                     ),
    
                                 IconButton(
              icon: Icon(Icons.play_circle_filled),
              onPressed: () {
                MediaNotification.showNotification(
                        title: 'Estas escuchando', author: 'JosueRadio');
                      
                    
                FlutterRadio.playOrPause(url: streamUrl);
                playingStatus();
              },
            ),
            IconButton(
              icon: Icon(Icons.pause_circle_filled),
              onPressed: () {
                FlutterRadio.playOrPause(url: streamUrl);
                playingStatus();
              },
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: () {
                FlutterRadio.playOrPause(url: streamUrl);
                playingStatus();
              },
            ),
            Text(
              'Check Playback Status: $isPlaying',
              style: TextStyle(fontSize: 25.0),
            )
                    
                    
                    

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
    });
  }
}

