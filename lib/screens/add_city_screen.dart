import 'dart:math';

import 'package:flutter/material.dart';
import 'package:was_hat_deine_stadt_app/database/city_database.dart';
import 'package:was_hat_deine_stadt_app/screens/city_list_screen.dart';





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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DatenFormular objektDatenFormular = DatenFormular();

  CityDatabase cdb = new CityDatabase();
  Random rnd = Random();


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
                      child: Text('Füge eine neue Stadt hinzu, indem du zunächst den Stadtnamen einträgtst.',
                          style: TextStyle(
                            fontSize: 14,
                          )
                      )
                  ),

                  SizedBox(height: 12),

                  //*******************************************************************************************************

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Stadtname',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => objektDatenFormular.name = value,
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: 30),

                  //add Stadt
                  ElevatedButton(
                    child: Text("Stadt hinzufügen"),
                    onPressed: () {
                      cdb.openDB();
                      _handleSubmitButton();
                      cdb.addStadt(objektDatenFormular.name, "52100");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                    ),
                  ),




















                  SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () {
                      cdb.openDB();
                    },
                    child: Container(
                      width: 150,
                      height: 35,
                      child: Center(child: Text("create DB")),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      cdb.addStadt("Bielefeld ${rnd.nextInt(1000)}", "52100");
                    },
                    child: Container(
                      width: 150,
                      height: 35,
                      child: Center(child: Text("neue Stadt")),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      cdb.alleStaedte();
                    },
                    child: Container(
                      width: 150,
                      height: 35,

                      child: Center(child: Text("anzeigen")),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CityListScreen(cdb))
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 35,
                      color: Colors.green,
                      child: Center(child: Text("liste anzeigen")),
                    ),
                  ),






                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubmitButton() {
    final form = _formKey.currentState;

    form.save();
  }

}

class DatenFormular {
  String name = "";
  String postleitzahl = "";
}
