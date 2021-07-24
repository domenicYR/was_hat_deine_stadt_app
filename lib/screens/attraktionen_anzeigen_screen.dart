import 'package:flutter/material.dart';
import 'package:was_hat_deine_stadt_app/model/data_model.dart';
import 'package:was_hat_deine_stadt_app/screens/add_city_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/city_list_screen.dart';

class AttraktionenAnzeigenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Was hat deine Stadt"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DataModel.cdb.getAttraktionen(),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
          // Fall 1: keine Daten geladen
          if (snapshot.connectionState == ConnectionState.none &&
              snapshot.hasData == null) {
            return Container(color: Colors.red);
          }
          // Fall 2: Daten werden noch geladen

          if (!snapshot.hasData) {

            return Container(

                color: Colors.blue
            );


          } else {
            // Fall 3: Daten wurden geladen und können angezeigt werden
            List<Map> result = snapshot.data as List<Map>;
            print(result);
            return ListView.builder(
                itemCount: result.length,
                itemBuilder: (context, index) {




                  return Padding(

                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Card(

                      // Button
                      child: ElevatedButton(


                        child: (Container(
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center, // Text Center
                            mainAxisAlignment: MainAxisAlignment.center,
//hallo
                            children: [


                              Text(result[index]["name"],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange,
                                ),
                              ),

                              Text(result[index]["beschreibung"],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange,
                                ),
                              ),

                              Text(result[index]["bild"],
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
    );
  }
}
