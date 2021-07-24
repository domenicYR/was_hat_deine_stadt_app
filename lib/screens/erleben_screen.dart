import 'package:flutter/material.dart';
import 'package:was_hat_deine_stadt_app/model/data_model.dart';
import 'package:was_hat_deine_stadt_app/screens/add_city_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/city_list_screen.dart';

class ErlebenScreen extends StatelessWidget {
  // StatefulWidget damit der Button funktioniert
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
    child: new Scaffold(
    appBar: new AppBar(
    title: new Text("data"),
    leading: new IconButton(
    icon: new Icon(Icons.ac_unit),
    onPressed: () => Navigator.of(context).pop(),

        ),
    ),
        body: SingleChildScrollView(
          child: Column(children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Sehenswürdigkeiten',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepOrange,
                        ),
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
                                'assets/images/frankfurt.png',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CityListScreen()),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.deepOrange),
                                    ),
                                    child: Icon(
                                      Icons.upload_outlined,),
                                  ),

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CityListScreen()),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.deepOrange),
                                    ),
                                    child: Icon(
                                      Icons.remove_red_eye_sharp,),
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
            ),
            //Sehenswürdigkeit Ende

            //Restaurant
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Restaurants',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepOrange,
                        ),
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
                                'assets/images/frankfurt.png',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [

                              Padding(// Restaurant Button 1
                                padding: const EdgeInsets.all(9.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CityListScreen()),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.deepOrange),
                                    ),
                                    child: Icon(
                                      Icons.upload_outlined,),
                                  ),
                                ),
                              ),
                              Padding( // Restaurant Button 2
                                padding: const EdgeInsets.all(0.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CityListScreen()),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.deepOrange),
                                    ),
                                    child: Icon(
                                      Icons.remove_red_eye_sharp,),
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
            ),
            //Restaurant Ende

            //Attraktionen
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Attraktionen',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepOrange,
                        ),
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
                                'assets/images/frankfurt.png',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [

                              Padding(// Attraktionen Button 1
                                padding: const EdgeInsets.all(9.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CityListScreen()),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.deepOrange),
                                    ),
                                    child: Icon(
                                      Icons.upload_outlined,),
                                  ),
                                ),
                              ),
                              Padding( // Attraktionen Button 2
                                padding: const EdgeInsets.all(0.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CityListScreen()),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.deepOrange),
                                    ),
                                    child: Icon(
                                      Icons.remove_red_eye_sharp,),
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
            ),
            //Attraktionen Ende

            //Einkaufsläden
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Einkaufsläden',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepOrange,
                        ),
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
                                'assets/images/einkaufen.png',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [

                              Padding( // Einkaufsladen Button 1
                                padding: const EdgeInsets.all(9.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddCityScreen()),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.deepOrange),
                                    ),
                                    child: Icon(
                                      Icons.upload_outlined,),
                                  ),
                                ),
                              ),

                              Padding( // Einkaufsladen Button 2
                                padding: const EdgeInsets.all(0.0),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddCityScreen()),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.deepOrange),
                                    ),
                                    child: Icon(
                                      Icons.remove_red_eye_sharp,),
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
            ),
          ]),
        ),
      ),
    );
  }
}
