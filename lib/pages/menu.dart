import 'package:flutter/cupertino.dart';
import 'package:rcj/pages/anuncios.dart';
import 'package:rcj/pages/biblia.dart';
import 'package:rcj/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:rcj/pages/menu2.dart';
import 'package:rcj/pages/predicaspage.dart';
import 'package:rcj/widgets/RadioLive.dart';
import 'package:rcj/widgets/videolist.dart';




class MenuApp extends StatefulWidget {
  MenuApp({Key? key}) : super(key: key);

  @override
  _MenuAppState createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {

int _selectedIndex = 0;
List<Widget> _opcionesMenu = <Widget>[
  HomePage(),
  PredicasPage(),
  BibliaPage(),
  Anuncios(),
  MenuDos()

];


void _onItemTap(int index){
  setState(() {
    _selectedIndex = index;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: 
        [
          
          Center(
          child:  _opcionesMenu.elementAt(_selectedIndex),
        ),
          _tarjeta(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        
        items: const <BottomNavigationBarItem>[
        
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house_fill), 
          title: Text('Inicio'),
          ),
          BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.play_rectangle_fill), 
          title: Text('Predicas'),
          ),
          BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book), 
          title: Text('Biblia'),
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble), 
          title: Text('Anuncios'),
          ),
          BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.square_list_fill), 
          title: Text('Menu'),
          ),
      ],
      currentIndex: _selectedIndex,
      activeColor: Color.fromRGBO(59,66,84,1),
      inactiveColor: Color.fromRGBO(128,128,128,1),
      onTap: _onItemTap,
      ),
    );
  }

Widget _tarjeta(){
  return DraggableScrollableSheet(
      initialChildSize: 0.07,
      minChildSize: 0.07,
      maxChildSize: 0.5,
      builder: (context, ScrollController){
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)
            )
          ),
          child: RadioLive( ScrollController),

        );
      }
    );
}

}