import 'package:cloud_firestore/cloud_firestore.dart';

class RecienteH{     
 late FirebaseFirestore firestore;
  initialiase(){
    firestore = FirebaseFirestore.instance;

  }
  Future<List> leer() async{
    QuerySnapshot querySnapshot;
    List docs=[];
    try{
      querySnapshot = await firestore.collection('videos').orderBy('fecha', descending: true).limit(1).get();
      if(querySnapshot.docs.isNotEmpty){
        for(var doc in querySnapshot.docs.toList()){
          Map a = {
            "id": doc.id,
            "autor": doc['autor'],
            "fecha": doc['fecha'],
            "link": doc['link'],
            "titulo": doc['titulo'],
            "categoria": doc['categoria']
            };
            docs.add(a);

        }
        return docs;
      }

    }catch(e){
      print(e);
    }return docs ;
    
  }
}

class ReflexionesH{     
 late FirebaseFirestore firestore;
  initialiase(){
    firestore = FirebaseFirestore.instance;

  }
  Future<List> leer() async{
    QuerySnapshot querySnapshot;
    List docs=[];
    try{
      querySnapshot = await firestore.collection('videos').where("categoria", isEqualTo: 2).get();
      if(querySnapshot.docs.isNotEmpty){
        for(var doc in querySnapshot.docs.toList()){
          Map a = {
            "id": doc.id,
            "autor": doc['autor'],
            "fecha": doc['fecha'],
            "link": doc['link'],
            "titulo": doc['titulo'],
            "categoria": doc['categoria']
            };
            docs.add(a);

        }
        return docs;
      }

    }catch(e){
      print(e);
    }return docs ;
    
  }
}

class AnunciosH{     
 late FirebaseFirestore firestore;
  initialiase(){
    firestore = FirebaseFirestore.instance;

  }
  Future<List> leer() async{
    QuerySnapshot querySnapshot;
    List docs=[];
    try{
      querySnapshot = await firestore.collection('anuncios').get();
      if(querySnapshot.docs.isNotEmpty){
        for(var doc in querySnapshot.docs.toList()){
          Map a = {
            "id": doc.id,
            "imagen": doc['Imagen'],
            "detalle": doc['detalle'],
            "fecha": doc['fecha'],
            "titulo": doc['titulo'],
            
            };
            docs.add(a);

        }
        return docs;
      }

    }catch(e){
      print(e);
    }return docs ;
    
  }
}

class Videovivo{     
 late FirebaseFirestore firestore;
  initialiase(){
    firestore = FirebaseFirestore.instance;

  }
  Future<List> leer() async{
    QuerySnapshot querySnapshot;
    List docs=[];
    try{
      querySnapshot = await firestore.collection('live').get();
      if(querySnapshot.docs.isNotEmpty){
        for(var doc in querySnapshot.docs.toList()){
          Map a = {
            "id": doc.id,
            "titulo": doc['titulo'],
            "link": doc['enlace'],
            "live": doc['live'],
            
            
            };
            docs.add(a);

        }
        return docs;
      }

    }catch(e){
      print(e);
    }return docs ;
    
  }
}

class Programacion{     
 late FirebaseFirestore firestore;
  initialiase(){
    firestore = FirebaseFirestore.instance;

  }
  Future<List> leer() async{
    QuerySnapshot querySnapshot;
    List docs=[];
    try{
      querySnapshot = await firestore.collection('programacion').get();
      if(querySnapshot.docs.isNotEmpty){
        for(var doc in querySnapshot.docs.toList()){
          Map a = {
            "id": doc.id,
            "titulo": doc['titulo'],
            "hora": doc['hora'],
            "descripcion": doc['descripcion'],
            
            
            };
            docs.add(a);

        }
        return docs;
      }

    }catch(e){
      print(e);
    }return docs ;
    
  }
}


class Videos{     
 late FirebaseFirestore firestore;
  initialiase(){
    firestore = FirebaseFirestore.instance;

  }
  Future<List> leer(int numero) async{
    QuerySnapshot querySnapshot;
    List docs=[];

    try{

      if(numero == 0){
        querySnapshot = await firestore.collection('videos').get();

      }else{
        querySnapshot = await firestore.collection('videos').where("categoria", isEqualTo: numero).get();
      }
      
      if(querySnapshot.docs.isNotEmpty){
        for(var doc in querySnapshot.docs.toList()){
          Map a = {
            "id": doc.id,
            "autor": doc['autor'],
            "fecha": doc['fecha'],
            "link": doc['link'],
            "titulo": doc['titulo'],
            "categoria": doc['categoria']
            };
            docs.add(a);

        }
        return docs;
      }

    }catch(e){
      print(e);
    }return docs ;
    
  }
}