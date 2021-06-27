import 'package:flutter/material.dart';

class start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('Was hat deine Stadt'),
        ),
            body: Card(child:Column(children:<Widget>[
              Image.asset("assets/images/las_vegas.jpg"),
              Text('Unsere Städte')
          ],),),
      )
    );
  }
}