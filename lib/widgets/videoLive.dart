import 'package:flutter/material.dart';
import 'package:rcj/models/database.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoLive extends StatefulWidget {
  VideoLive({Key? key}) : super(key: key);

  @override
  _VideoLiveState createState() => _VideoLiveState();
}

class _VideoLiveState extends State<VideoLive> {

late Videovivo db;
 List docs = [];
 
 initialise(){
   db = Videovivo();
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
    return Container(
       child: ListView.builder(
         shrinkWrap: true,
         itemCount:  docs.length,
         itemBuilder: (BuildContext context, int index){
           String url = docs[index]['link'].toString();  
           String id = url.substring(url.length -11);
           return Column(
             children: <Widget>[
              _View(docs[index]['live'],id ),
               
             ],
           );
         }
       )
    );
  }

  Widget _View(bool live, String id){
    if (live == true) {
      return Container(
        child: YoutubePlayer(
                                                controller: YoutubePlayerController(
                                                initialVideoId: id,
                                                flags: YoutubePlayerFlags(
                                                  isLive: true,
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
      );
    } else {
      return Container(
        height: 205,
        decoration: BoxDecoration(
          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage('https://uninternetradio.files.wordpress.com/2018/10/logo-fuera-del-aire.jpg')),
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(10),                                        
                                      ),
        );
      
    }
    
  }

  

}