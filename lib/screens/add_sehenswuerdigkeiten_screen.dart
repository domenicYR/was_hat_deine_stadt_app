import 'package:flutter/material.dart';
import 'package:was_hat_deine_stadt_app/model/data_model.dart';

List<Map> resultGlobal;
int indexGlobal;

class AddSehenswuerdigkeitenScreen extends StatelessWidget {

  // Konstruktor
  AddSehenswuerdigkeitenScreen(List<Map> result, int index) {
    resultGlobal = result;
    indexGlobal = index;
    print(resultGlobal[indexGlobal]["id"]);
  }

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
                    "Deine Stadt -",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),

                  Text(
                    "Attraktionen",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),

                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Text('Füge der Stadt deine Lieblingsattraktionen hinzu.',
                          style: TextStyle(
                            fontSize: 14,
                          )
                      )
                  ),

                  SizedBox(height: 12),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => objektDatenFormular.name = value,
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: 20),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Beschreibung',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => objektDatenFormular.beschreibung = value,
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: 20),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Bild hinzufügen',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => objektDatenFormular.bild = value,
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: 30),

                  ElevatedButton(
                    child: Text("Jetzt hinzufügen"),
                    onPressed: () {
                      _handleSubmitButton();
                      DataModel.cdb.addSehenswuerdigkeiten(objektDatenFormular.name, objektDatenFormular.beschreibung, objektDatenFormular.bild, resultGlobal[indexGlobal]["id"]);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
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
  String beschreibung = "";
  String bild = "";
}
