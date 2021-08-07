import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:collection/collection.dart';


Future<List> obtenerPeticion(String libro, int index) async{
  var data;
  var result;
  

  String url = 'https://bible-app-demo.herokuapp.com/api/books/$libro/verses/$index';
 print(url);
  final response = await http.get(url);
  if(response.statusCode == 200){

    data = jsonDecode(response.body);
    data.sort((a, b) => compareNatural(a['reference'], b['reference']));

    
       
    return data;
  }else{

     return [];
  }

}

class bibliaVerse extends StatefulWidget {
 var index;
  var libro;
  var nombre;
  bibliaVerse({this.libro, this.index, this.nombre}) ;

  @override
  _bibliaVerseState createState() => _bibliaVerseState();
}

class _bibliaVerseState extends State<bibliaVerse> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(widget.nombre +' '+widget.index.toString()) ,),
          child: Column(
        children: [
          Flexible(
            child: Container(
               child: FutureBuilder<List>(
                 future: obtenerPeticion(widget.libro,widget.index),
                 builder: (context , snapshot){
                   if(snapshot.hasError) print(snapshot.error);
                   return snapshot.hasData
                   ? new ItemList(list: snapshot.data)
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
  
  bool _isLoading= false;
  var list;
  ItemList({required this.list});
  

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context, i){
        return Card(
          child: new ListTile(
            title: new Text(list[i]['cleanText'].toString()),
          ),
        );
      }
    );
  }
}
