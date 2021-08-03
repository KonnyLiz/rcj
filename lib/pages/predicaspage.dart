import 'package:flutter/material.dart';

class PredicasPage extends StatelessWidget {
  const PredicasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container( 
          child: Text('Predicas'),
        ),
      ),
    );
  }
}