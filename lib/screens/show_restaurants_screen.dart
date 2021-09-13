import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:was_hat_deine_stadt_app/model/data_model.dart';
import 'package:was_hat_deine_stadt_app/screens/add_city_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/city_list_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/start_screen.dart';

class ShowRestaurantsScreen extends StatefulWidget {
  List<Map> result;
  int index;

  // Konstruktor
  ShowRestaurantsScreen(List<Map> result, int index) {
    this.result = result;
    this.index = index;
    print(result[index]["id"]);
  }

  @override
  _ShowRestaurantsScreenState createState() => _ShowRestaurantsScreenState();
}

class _ShowRestaurantsScreenState extends State<ShowRestaurantsScreen> {
  // Für die Navigationsleiste im Screen, unten
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Städte',
      style: optionStyle,
    ),
    Text(
      'Index 2: Stadt hinzufügen',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch(index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  StartScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CityListScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AddCityScreen()),
        );
        break;
      default:
        print('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Was hat deine Stadt"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DataModel.cdb.getRestaurants(widget.result[widget.index]["id"]),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
          // Fall 1: keine Daten geladen
          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.hasData == null) {
            return Container(color: Colors.red);
          }
          // Fall 2: Daten werden noch geladen
          if (!snapshot.hasData) {
            return Container(color: Colors.blue);
          } else {
            // Fall 3: Daten wurden geladen und können angezeigt werden
            List<Map> result = snapshot.data as List<Map>;
            print(result);
            return ListView.builder(
                itemCount: result.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(children: [


                      // body
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            children: <Widget>[


                              // Teil 1: Name
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  result[index]["name"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),


                              // Teil 2: Bild
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          'assets/images/frankfurt.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),


                              // Teil 3: Beschreibung
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Text(
                                              result[index]["beschreibung"],
                                              style: TextStyle(fontSize: 15)),
                                        ),


                                        // Teil 4: Button
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12.0, bottom: 4.0),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                _launchURL(result[index]["link"]);
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                                    Colors.deepOrange),
                                              ),
                                              child: Text('Erfahre mehr'),
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
                  );
                });
          }
        },
      ),

      // Für die Navigationsleiste im Screen, unten
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.visibility),
            label: 'Städte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_outlined),
            label: 'Stadt hinzufügen',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.deepOrange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: _onItemTapped,
      ),
    );
  }

  _launchURL(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}
