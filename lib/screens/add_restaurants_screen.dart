import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:was_hat_deine_stadt_app/model/data_model.dart';
import 'package:was_hat_deine_stadt_app/screens/add_city_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/city_list_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/start_screen.dart';

List<Map> resultGlobal;
int indexGlobal;
int validierung = 0;

class AddRestaurantsScreen extends StatelessWidget {

  // Konstruktor
  AddRestaurantsScreen(List<Map> result, int index) {
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

  File _image;

  final picker = ImagePicker();

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
                    "Restaurants",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),

                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Text('Füge der Stadt deine Lieblingsrestaurants hinzu.',
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Eingabefeld darf nicht leer sein!';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Beschreibung',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => objektDatenFormular.beschreibung = value,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Eingabefeld darf nicht leer sein!';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Link zum Restaurant',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => objektDatenFormular.link = value,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Eingabefeld darf nicht leer sein!';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Color(0xffFDCF09),
                        child: _image != null
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            _image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                            : Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50)),
                          width: 100,
                          height: 100,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  ElevatedButton(
                    child: Text("Jetzt hinzufügen"),
                    onPressed: () {
                      _handleSubmitButton();
                      if (validierung == 0) {
                        print("ungültig");
                      } else {
                        DataModel.cdb.addRestaurants(
                            objektDatenFormular.name,
                            objektDatenFormular.beschreibung,
                            objektDatenFormular.link,
                            resultGlobal[indexGlobal]["id"]);
                        _showAlertDialog();
                        validierung = 0;
                      }
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
          title: Text('Restaurant wurde hinzugefügt!'),
        );
      },
    );
  }

  Future<void> _imgFromCamera() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if(pickedImage != null){
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _imgFromGallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if(pickedImage != null){
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),

          );
        }
    );
  }

}

class DatenFormular {
  String name = "";
  String beschreibung = "";
  String link = "";
  String bild = "";
}
