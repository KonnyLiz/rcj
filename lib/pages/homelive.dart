import 'package:flutter/material.dart';
import 'package:rcj/widgets/RadioLive.dart';
import 'package:rcj/widgets/videoLive.dart';

class homeLive extends StatefulWidget {
  homeLive({Key? key}) : super(key: key);

  @override
  _homeLiveState createState() => _homeLiveState();
}

class _homeLiveState extends State<homeLive> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                     _Videolive()
    
                  ],
                ),
          )
    
        ],
      ),
    );
  }

  Widget _Videolive(){
    return Container(
      child: VideoLive(),
    );
  }
  
}