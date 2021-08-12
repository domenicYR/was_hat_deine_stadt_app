import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:was_hat_deine_stadt_app/model/data_model.dart';

List<Map> resultGlobal;
int indexGlobal;

class AddAttraktionenScreen extends StatelessWidget {
  // Konstruktor
  AddAttraktionenScreen(List<Map> result, int index) {
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
                      labelText: 'Link zur Attraktion',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => objektDatenFormular.link = value,
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
                      DataModel.cdb.addAttraktionen(
                          objektDatenFormular.name,
                          objektDatenFormular.beschreibung,
                          objektDatenFormular.link,
                          objektDatenFormular.bild,
                          resultGlobal[indexGlobal]["id"]);
                      _showAlertDialog();
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

    _formKey.currentState.reset();
  }

  void _showAlertDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Attraktion wurde hinzugefügt!'),
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
