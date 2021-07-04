import 'package:flutter/material.dart';
import 'package:was_hat_deine_stadt_app/screens/add_city_screen.dart';

class IndexScreen extends StatelessWidget {
  // StatefulWidget damit der Button funktioniert
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
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
              Card(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Unsere Städte',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.85,
                          decorationColor: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'assets/images/las_vegas.jpg',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text('Was haben unsere Städte zu bieten',
                                  style: TextStyle(fontSize: 15)),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                                    ),
                                    child: Text('Zu den Städten'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Deine Städte',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.85,
                          decorationColor: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'assets/images/las_vegas.jpg',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text('Füge jetzt eine Stadt hinzu',
                                  style: TextStyle(fontSize: 15)),
                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AddCityScreen()),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                                    ),
                                    child: Text('Zu den Städten'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
