import 'package:flutter/material.dart';
import 'package:was_hat_deine_stadt_app/model/data_model.dart';
import 'package:was_hat_deine_stadt_app/screens/add_city_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/erleben_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/start_screen.dart';

class CityListScreen extends StatefulWidget {
  @override
  _CityListScreenState createState() => _CityListScreenState();
}

class _CityListScreenState extends State<CityListScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
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
        future: DataModel.cdb.getStaedte(),
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


                  // body
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Card(


                      // Button
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ErlebenScreen(result, index)),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: (Container(
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,


                            // Text Center
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                result[index]["name"],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                  );
                });
          }
        },
      ),
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
}
