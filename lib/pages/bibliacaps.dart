import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:rcj/pages/bibliaverse.dart';

Future<List> obtenerPeticion(String libro) async{
  var data;
  var result;
  

  String url = 'https://bible-app-demo.herokuapp.com/api/books/$libro';
 print(url);
  final response = await http.get(url);
  if(response.statusCode == 200){

    data = jsonDecode(response.body)['chapters'];

    
       
    return data;
  }else{

     return [];
  }

}

class bibliaCaps extends StatefulWidget {
 
  var libro;
  var nombre;
  bibliaCaps({this.libro, this.nombre}) ;

  @override
  _bibliaCapsState createState() => _bibliaCapsState();
}

class _bibliaCapsState extends State<bibliaCaps> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(widget.nombre) ,),
          child: Column(
        children: [
          Flexible(
            child: Container(
               child: FutureBuilder<List>(
                 future: obtenerPeticion(widget.libro),
                 builder: (context , snapshot){
                   if(snapshot.hasError) print(snapshot.error);
                   return snapshot.hasData
                   ? new ItemList(list: snapshot.data, libro: widget.libro, nombre: widget.nombre,)
                   : new Center(
                    
                     child: new CircularProgressIndicator(),
                   );
                    
                 },
                 
               ),
            ),
          ),
   
         
        ],
      ),
    );
  }
}


class ItemList extends StatelessWidget {
  var libro;
  var nombre;
  bool _isLoading= false;
  var list;
  ItemList({required this.list, this.libro, this.nombre});
  int caps = 0;

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context, i){
        caps++;
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(
                                      CupertinoPageRoute(
                                        builder: (context) => bibliaVerse(libro: libro , index: i+1, nombre: nombre ,),
                                      ),
                                    );
          },
          child: Card(
            child: new ListTile(
              leading: Text('Capitulo'),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: new Text( list[i]['chapter'].toString()),
            ),
          ),
        );
      }
    );
  }
}
