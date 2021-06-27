import 'package:flutter/material.dart';

class IndexScreen extends StatelessWidget {  // StatefulWidget damit der Button funktioniert
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            title: Text('Was hat deine Stadt'),
          ),
          body: Column(
            children: [
              Card(
                  child:Column(
                      children:<Widget>[
                        Image.asset(
                            "assets/images/las_vegas.jpg",

                        ),
                        Text(
                            '',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        )


            ],

          ),
    ),
              Card(
                child:Column(
                  children:<Widget>[
                    Text(
                      'Unsere Städte',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Image.asset(
                        'assets/images/las_vegas.jpg',
                            width:250.0,
                            height:120.0,
                    ),
                    Text(
                        'Was haben unsere Städte zu bieten',
                      style: TextStyle(fontSize: 15),
                    ),
                    Container(  //Button
                      margin: EdgeInsets.all(2.0),
                      child:RaisedButton(
                        onPressed: () {},
                        child: Text('Zu den Städten'),
                      ),)

                  ],

                ),
              ),

              Card(
                child:Column(
                  children:<Widget>[
                    Text(
                      'Deine Städte',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Image.asset(
                      'assets/images/las_vegas.jpg',
                      width:250.0,
                      height:120.0,
                    ),
                    Text(
                      'Füge jetzt eine Stadt hinzu',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Container(   //Button
                      margin: EdgeInsets.all(2.0),
                      child:RaisedButton(
                        onPressed: () {},
                        child: Text('Zu den Städten'),
                      ),)

                  ],

                ),
              ),

    ],
    )
        ),
    );

  }
}
