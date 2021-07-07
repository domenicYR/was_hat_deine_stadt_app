import 'package:flutter/material.dart';

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

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Stadtname',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: 30),

                  ElevatedButton(
                    child: Text("Stadt hinzufügen"),
                    onPressed: () {
                      //_handleSubmitButton();
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
}
