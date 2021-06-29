import 'package:flutter/material.dart';

class AddCityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          child: Scrollbar(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Text(
                    "Deine Städte -",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        fontSize: 18
                    ),
                  ),

                  Text(
                    "Füge eine Stadt hinzu",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        fontSize: 18,
                    ),
                  ),

                  SizedBox(height: 25),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Stadtname',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),

                  SizedBox(height: 25),

                  ElevatedButton(
                    child: Text("Jetzt Stadt hinzufügen"),
                    onPressed: () {
                      //_handleSubmitButton();
                    },
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
