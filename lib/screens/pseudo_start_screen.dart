import 'dart:async';

import 'package:flutter/material.dart';
import 'package:was_hat_deine_stadt_app/model/data_model.dart';
import 'package:was_hat_deine_stadt_app/screens/index_screen.dart';

class PseudoStartScreen extends StatefulWidget {

  @override
  _PseudoStartScreenState createState() => _PseudoStartScreenState();
}

class _PseudoStartScreenState extends State<PseudoStartScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    DataModel.cdb.openDB();
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => IndexScreen()
    )
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange,
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Container(
              child: CircleAvatar(
                  child: Image.asset('assets/images/logo.png'),
                  backgroundColor: Colors.white,
                  radius: 100,
                ),
              ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ]
        )
      )
    );
  }

}
