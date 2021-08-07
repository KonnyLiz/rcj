import 'package:flutter/material.dart';
import 'package:rcj/models/database.dart';


class programacionLista extends StatefulWidget {
  programacionLista({Key? key}) : super(key: key);

  @override
  _programacionListaState createState() => _programacionListaState();
}

class _programacionListaState extends State<programacionLista> {

  @override
  

  
late Programacion db;
 List docs = [];
 
 initialise(){
   db = Programacion();
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
              
               ListView.builder(
                 shrinkWrap: true,
                itemCount:  docs.length,
                itemBuilder: (BuildContext context, int index){

                  return Card(
                    color: Color.fromRGBO(116, 128, 150, 1),
                    elevation: 8,
                    shadowColor: Colors.black,
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      
                    borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: ExpansionTile(
                        iconColor: Colors.white,
                        collapsedIconColor: Colors.white,
                        collapsedBackgroundColor: Color.fromRGBO(116, 128, 150, 1),
                        backgroundColor: Color.fromRGBO(116, 128, 150, 1),
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(docs[index]['hora'].toString(),
                            style: TextStyle(color: Colors.white),),
                            VerticalDivider(),
                          ],
                        ),
                        title: Text(docs[index]['titulo'].toString(),
                            style: TextStyle(color: Colors.white)),
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Text(docs[index]['descripcion'].toString(),
                            style: TextStyle(color: Colors.white)))
                          
                        
                      ],),
                    ),
                  );

                                  })


             ],
             ),
        ),
      ],
    );
  }
}