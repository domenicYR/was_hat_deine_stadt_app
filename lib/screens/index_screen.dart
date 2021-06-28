import 'package:flutter/material.dart';

class IndexScreen extends StatelessWidget {
  // StatefulWidget damit der Button funktioniert
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Was hat deine Stadt'),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/las_vegas.jpg",
                  ),
                  Text(
                    '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
              Card(
                child: Container(

                  child: Column(

                    children: <Widget>[
                      Text(
                        'Unsere Städte',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/las_vegas.jpg',
                            width: 150.0,
                            height: 120.0,
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              'Was haben unsere Städte zu bieten. Lass dich ',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
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
              ),
              Card(
                child: Container(

                  child: Column(

                    children: <Widget>[
                      Text(
                        'Deine Städte',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/las_vegas.jpg',
                            width: 150.0,
                            height: 120.0,
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              'Füge jetzt eine Stadt hinzu',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
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
              ),
            ]),
            /*
            child: Container(

              color: Color.fromARGB(190, 255, 255, 255),
              height: 140,
              width: MediaQuery.of(context).size.width * 0.97,
              child: Column(
                children: [


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 250,
                          child: Text("Motel One Lübeck, Schüsselbuden 15",
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ),
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 48, 52, 113),
                          radius: 30,
                          child: Icon(
                            Icons.card_travel_outlined,
                            size: 40,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 250,
                          child: Text(
                              "Wir begrüßen Sie heute in unserem"
                                  " günstigen Design Hotel.",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 14,
                              )),
                        ),
                        Text("ab 350€",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            */

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
