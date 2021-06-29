import 'package:flutter/material.dart';
import 'package:was_hat_deine_stadt_app/screens/add_city_screen.dart';

class IndexScreen extends StatelessWidget {
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
              Card(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Unsere Städte',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
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
                          decorationColor: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
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

            /*
            child: Column(
              children: [
                Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/las_vegas.jpg",
                    ),
                    Text(
                      '',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Unsere Städte',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Image.asset(
                        'assets/images/las_vegas.jpg',
                        width: 250.0,
                        height: 120.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Was haben unsere Städte zu bieten',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          //Button
                          margin: EdgeInsets.all(2.0),
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text('Zu den Städten'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Deine Städte',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Image.asset(
                        'assets/images/las_vegas.jpg',
                        width: 250.0,
                        height: 120.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Füge jetzt eine Stadt hinzu',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          //Button
                          margin: EdgeInsets.all(2.0),
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text('Zu den Städten'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
              */
          )),
    );
  }
}
