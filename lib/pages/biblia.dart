import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:rcj/pages/bibliacaps.dart';

Future<List> obtenerPeticion() async{
  var data;
  var result;
  

  String url = 'https://bible-app-demo.herokuapp.com/api/books';
 
  final response = await http.get(url);
  if(response.statusCode == 200){

    data = jsonDecode(response.body);
    data.sort((a, b) => compareNatural(a['order'], b['order']));
    
    return data;
  }else{

     return [];
  }

}

class BibliaPage extends StatefulWidget {
  BibliaPage({Key? key}) : super(key: key);

  @override
  _BibliaPageState createState() => _BibliaPageState();
}

class _BibliaPageState extends State<BibliaPage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            child: Container(
               child: FutureBuilder<List>(
                 future: obtenerPeticion(),
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
    SizedBox(height: 60,)
         
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
        var nombre = list[i]['name'].toString();
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(
                                      CupertinoPageRoute(
                                        builder: (context) => bibliaCaps(libro:list[i]['id'], nombre: nombre,),
                                      ),
                                    );
          },
          child: Card(
            child: new ListTile(
              trailing: Icon(Icons.keyboard_arrow_right),
              title: new Text(list[i]['name'].toString()),
            ),
          ),
        );
      }
    );
  }
}