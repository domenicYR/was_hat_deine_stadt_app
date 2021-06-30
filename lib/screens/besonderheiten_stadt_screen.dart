import 'package:flutter/material.dart';
import 'package:was_hat_deine_stadt_app/screens/add_city_screen.dart';

class BesonderheitenStadtScreen extends StatelessWidget {
  // StatefulWidget damit der Button funktioniert
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Was hat deine Stadt'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        "assets/images/las_vegas.jpg",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Zu den Städten'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Zu den Städten'),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Zu den Städten'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Zu den Städten'),
                  ),
                ],
              ),
            ]),
          )),
    );
  }
}
