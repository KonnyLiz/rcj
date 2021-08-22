import 'dart:io';
import 'package:flutter_radio/flutter_radio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_media_notification/flutter_media_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:rcj/pages/menu.dart';
import 'package:rcj/widgets/programacion.dart';
import 'package:notification_audio_player/notification_audio_player.dart';
import 'package:awesome_notifications/awesome_notifications.dart';


class RadioLive extends StatefulWidget {

  final ScrollController scrollController;
  RadioLive(this.scrollController) ;

  @override
  _RadioLiveState createState() => _RadioLiveState();
}


class _RadioLiveState extends State<RadioLive> {
NotificationAudioPlayer notificationAudioPlayer = NotificationAudioPlayer();



bool selected = false;
String status = 'hidden';


static const streamUrl = "http://enfoquescreativos.com:8010/stream";

 late bool isPlaying;
 
  bool _loading = false;
  bool _isLive = false;

 @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
  if (!isAllowed) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Permitir Notificaciones'),
        content: Text('Esta app te enviara notificaciones'),
        actions:[
          TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('No permitir', style: TextStyle(color: Colors.grey, fontSize: 18),)
            ),
            TextButton(
            onPressed: ()=>  AwesomeNotifications().requestPermissionToSendNotifications().then((_) => Navigator.pop(context)),
            child: Text('Permitir', style: TextStyle(color: Colors.green, fontSize: 18,fontWeight: FontWeight.bold),)
            ),

        ],
        
        ),

    );
    // Insert here your friendly dialog box before call the request method
    // This is very important to not harm the user experience

  }

   
                                        
});



    

  notificationAudioPlayer.onCompleteEvent.listen((event) {
      print("complete");
    });
    notificationAudioPlayer.onResumeEvent.listen((event) {
      print("resume");
      playingStatus();
    });
    notificationAudioPlayer.onPauseEvent.listen((event) {
      playingStatus();
      print("pause");
    });
    notificationAudioPlayer.onStopEvent.listen((event) {
      print("stop");
    });
    notificationAudioPlayer.switchPreviousEvent.listen((event) {
      print("switch previous");
    });
    notificationAudioPlayer.switchNextEvent.listen((event) {
      print("swtich next");
    });
    notificationAudioPlayer.curPosEvent.listen((data) {
      print('current position: $data');
    });
    notificationAudioPlayer.preparedDurationEvent.listen((data) {
      print("duration: $data");
    });
    notificationAudioPlayer.headPhoneOutEvent.listen((event) {
      print("headphone out");
    });
    notificationAudioPlayer.headPhoneInEvent.listen((event) {
      print("headphone in");
    });

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
                                icon: Icon(selected ?  CupertinoIcons.play_circle:  CupertinoIcons.pause_circle, 
                                color: Colors.white,
                                size: 30,),
                                onPressed: () async{
                                  

                                  if(Platform.isIOS){
                                   
                               
                                   FlutterRadio.playOrPause(url: streamUrl);
                                   Notify();
                                   playingStatus();
                                     //localnotification method call below
                   // when user top on notification this listener will work and user will be navigated to notification page
                
                                   
                                  }else{    String title = "Estas Escuchando";
                                            String author = "JoseRadio";
                                            String avatar = "https://scontent.fsal5-1.fna.fbcdn.net/v/t1.18169-9/13892068_836787956464358_3057000804393912564_n.png?_nc_cat=109&ccb=1-5&_nc_sid=174925&_nc_ohc=IvBvQwU1eWQAX-Wkqdt&_nc_ht=scontent.fsal5-1.fna&oh=b374f1690f0e3f77a70ee2539f76c806&oe=614580DD";
                                            String url = "http://enfoquescreativos.com:8010/stream";
                                            print(await notificationAudioPlayer.play(title, author, avatar, url));
                                    playingStatus();

                                  }
                                    
                
                                  
                                  // MediaNotification.showNotification(
                                  // title: 'Estas escuchando', author: 'JosueRadio');
                                  
                                 
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
  void playingStatus() {

    

    if(selected == true){
      
      
      setState(() {
        notificationAudioPlayer.resume();
        
        selected = false;
        
      });
    }else{
      setState(() {
        notificationAudioPlayer.pause();
        notificationAudioPlayer.removeNotification();
        selected = true;
        
      });
    }
   
    // setState(() {
      
    //   status = 'play';
    //   selected = !selected;
      
      
    // });

  //  print(notificationAudioPlayer.playerState) ;
  }

  


  Widget _programacion(){
    return Container(
      child: programacionLista(),
    );
  }

void Notify()  async{
 await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'Estas escuchando',
        body: 'JosueRadio',
        bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
        notificationLayout: NotificationLayout.MediaPlayer,
        
      ),
    
  
  );
}

}


