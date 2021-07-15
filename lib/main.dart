import 'package:flutter/material.dart';
import 'package:was_hat_deine_stadt_app/model/data_model.dart';
import 'package:was_hat_deine_stadt_app/screens/add_city_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/attraktionen_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/besonderheiten_stadt_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/city_list_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/einkaufslaeden_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/index_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/restaurant_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/sehenswuerdigkeiten_screen.dart';
import 'package:was_hat_deine_stadt_app/screens/start_screen.dart';

void main() {
  DataModel dm = new DataModel();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexScreen(),
    );
  }
}
