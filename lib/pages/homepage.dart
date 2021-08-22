import 'package:flutter/material.dart';
import 'package:rcj/pages/homePrincipal.dart';
import 'package:rcj/pages/homelive.dart';

class HomePage extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home:  DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor:  Color.fromRGBO(240,240,240,1),
          body: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverAppBar(
                    backgroundColor: Colors.white,
                    
                title: TabBar(
                  indicatorColor: Colors.black87,
                tabs: [
                Tab(child: Text('Inicio', style: TextStyle( color: Colors.black87),)),
                Tab(child: Text('En Vivo', style: TextStyle( color: Colors.black87))),
              ],
            ),
                  ),
                ];
              },
              body: TabBarView(
                children: <Widget>[
                  _HomePrincipal(),
                  _HomeLive()
                ],
              ),
            ),
          )
         
        ),
      ),
    );
  }

Widget _HomePrincipal(){
  return Container(
    child: homePrincipal(),
  );
}

Widget _HomeLive(){
  return Container(
    child: homeLive(),
  );
}


}

