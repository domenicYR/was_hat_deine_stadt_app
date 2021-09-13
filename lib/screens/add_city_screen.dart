import 'package:flutter/material.dart';
import 'package:was_hat_deine_stadt_app/model/data_model.dart';
import 'package:was_hat_deine_stadt_app/screens/city_list_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/start_screen.dart';

int validierung = 0;

class AddCityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Was hat deine Stadt"),
        centerTitle: true,
      ),
      body: const Formular(),
    );
  }
}

class Formular extends StatefulWidget {
  const Formular({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormularState();
}

class _FormularState extends State<Formular> {
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DatenFormular objektDatenFormular = DatenFormular();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Text(
                    "Deine Städte -",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),

                  Text(
                    "Füge eine Stadt hinzu",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),

                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Text(
                          'Füge eine neue Stadt hinzu, indem du zunächst den Stadtnamen einträgtst.',
                          style: TextStyle(
                            fontSize: 14,
                          ))),

                  SizedBox(height: 12),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Stadtname',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => objektDatenFormular.name = value,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Eingabefeld darf nicht leer sein!';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 30),

                  ElevatedButton(
                    child: Text("Stadt hinzufügen"),
                    onPressed: () {
                      _handleSubmitButton();
                      if (validierung == 0) {
                        print("ungültig");
                      } else {
                        DataModel.cdb.addStadt(objektDatenFormular.name);
                        _showAlertDialog();
                        validierung = 0;
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.deepOrange),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
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

  void _handleSubmitButton() {
    final form = _formKey.currentState;

    if (!form.validate()) {
      print("Eingabe ungültig!");
    } else {
      form.save();
      _formKey.currentState.reset();
      validierung = 1;
    }
  }

  void _showAlertDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Stadt wurde hinzugefügt!'),
        );
      },
    );
  }
}

class DatenFormular {
  String name = "";
  String postleitzahl = "";
}
