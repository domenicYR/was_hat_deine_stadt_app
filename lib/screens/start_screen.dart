import 'dart:math';

import 'package:flutter/material.dart';
import 'package:was_hat_deine_stadt_app/database/city_database.dart';
import 'package:was_hat_deine_stadt_app/screens/city_list_screen.dart';

class StartScreen extends StatelessWidget {
  CityDatabase cdb = new CityDatabase();
  Random rnd = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SQFLite"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  cdb.deleteDB();
                },
                child: Container(
                  width: 150,
                  height: 35,
                  color: Colors.green,
                  child: Center(child: Text("delete DB")),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  cdb.openDB();
                },
                child: Container(
                  width: 150,
                  height: 35,
                  color: Colors.green,
                  child: Center(child: Text("create DB")),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  cdb.addStadt("Bielefeld ${rnd.nextInt(1000)}", "52100");
                },
                child: Container(
                  width: 150,
                  height: 35,
                  color: Colors.green,
                  child: Center(child: Text("neue Stadt")),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  cdb.alleStaedte();
                },
                child: Container(
                  width: 150,
                  height: 35,
                  color: Colors.green,
                  child: Center(child: Text("anzeigen")),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CityListScreen()));
                },
                child: Container(
                  width: 150,
                  height: 35,
                  color: Colors.green,
                  child: Center(child: Text("liste anzeigen")),
                ),
              ),
            ),
          ],
        ));
  }
}
