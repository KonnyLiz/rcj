import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

 
 
class videosView extends StatefulWidget {
  var list ;
  var index;
  var videoID;
  
  videosView({this.index,this.list,this.videoID}) ;

  @override
  _videosViewState createState() => _videosViewState();
}

class _videosViewState extends State<videosView> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.list[widget.index]['titulo']),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
               child: YoutubePlayer(
                                                controller: YoutubePlayerController(
                                                initialVideoId: widget.videoID,
                                                flags: YoutubePlayerFlags(
                                                    mute: false,
                                                    autoPlay: false,
                                                ),
                                                ),
                                                showVideoProgressIndicator: true,
                                                progressIndicatorColor: Colors.amber,
                                                progressColors: ProgressBarColors(
                                                playedColor: Colors.amber,
                                                handleColor: Colors.amberAccent,
                                                ),
                                                onReady: () {
                                                      print('Player is ready.');
                                                },
                                              ),
            ),
          ],
        ),
      ),
    );
  }
}


